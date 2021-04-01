<?php

namespace App\Controller;

use App\Entity\Blog;
use App\Entity\Comments;
use App\Form\CommentsType;
use App\Repository\CommentsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/comments")
 */
class CommentsController extends AbstractController
{
    /**
     * @Route("/", name="comments_index", methods={"GET"})
     */
    public function index(CommentsRepository $commentsRepository): Response
    {
        return $this->render('comments/index.html.twig', [
            'comments' => $commentsRepository->findAll(),
        ]);
    }

    /**
     * @Route("/all_user_comments", name="all_user_comments", methods={"GET"})
     */
    public function all_user_comments(CommentsRepository $commentsRepository): Response
    {
        $user = $this->getUser();

        return $this->render('comments/allcomments.html.twig', [
            'comments' => $commentsRepository->findBy(['user' => $user]),
        ]);
    }

    /**
     * @Route("/comments_new/{id}", name="comments_new", methods={"POST"})
     */
    public function new(Blog $blog, Request $request): Response
    {
        $comment = new Comments();
        $comment->setComment($request->get('message'));
        $comment->setUser($this->getUser());
        $comment->setBlog($blog);

        $entityManager = $this->getDoctrine()->getManager();
        $entityManager->persist($comment);
        $entityManager->flush();

        $this->addFlash('success', 'Comment is added successfully. Check more !');

        return $this->redirectToRoute('blog_index');
    }

    /**
     * @Route("/{id}", name="comments_show", methods={"GET"})
     */
    public function show(Comments $comment): Response
    {
        return $this->render('comments/show.html.twig', [
            'comment' => $comment,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="comments_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Comments $comment): Response
    {
        $form = $this->createForm(CommentsType::class, $comment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('comments_index');
        }

        return $this->render('comments/edit.html.twig', [
            'comment' => $comment,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="comments_delete", methods={"POST"})
     */
    public function delete(Request $request, Comments $comment): Response
    {
        if ($this->isCsrfTokenValid('delete'.$comment->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($comment);
            $entityManager->flush();
        }

        return $this->redirectToRoute('comments_index');
    }
}
