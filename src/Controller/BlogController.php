<?php

namespace App\Controller;

use App\Entity\Blog;
use App\Form\BlogType;
use App\Repository\BlogRepository;
use App\Repository\CommentsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/blog")
 */
class BlogController extends AbstractController
{
    /**
     * @Route("/", name="blog_index", methods={"GET"})
     */
    public function index(BlogRepository $blogRepository): Response
    {
        return $this->render('blog/index.html.twig', [
            'blogs' => $blogRepository->findAll(),
        ]);
    }

    /**
     * @Route("/blog_category/{variable}", name="blog_category", methods={"GET"})
     */
    public function category($variable, BlogRepository $blogRepository): Response
    {
        return $this->render('blog/category.html.twig', [
            'blogs' => $blogRepository->findBy(['category' => $variable]),
        ]);
    }

    /**
     * @Route("/blog_details/{blogid}", name="blog_details", methods={"GET"})
     */
    public function blog_details($blogid, BlogRepository $blogRepository, CommentsRepository $commentrepositorty): Response
    {
        return $this->render('blog/blogdetails.html.twig', [
            'blogs' => $blogRepository->findBy(['id' => $blogid]),
            'comments' => $commentrepositorty->findBy(['blog' => $blogid]),
        ]);
    }

    /**
     * @Route("/blog_filter_date", name="blog_filter_date", methods={"GET","POST"})
     */
    public function filter_date(BlogRepository $blogRepository, Request $request): Response
    {
        $date1 = $request->get('datepicker');
        $blogs = $blogRepository->findByDate($date1);


        return $this->render('blog/date.html.twig', [
            'blogs' => $blogs
        ]);
    }

    /**
     * @Route("/all_user_blog", name="all_user_blog", methods={"GET"})
     */
    public function all_user_blog(BlogRepository $blogRepository): Response
    {
        $user = $this->getUser();

        return $this->render('blog/allblog.html.twig', [
            'blogs' => $blogRepository->findBy(['user' => $user]),
        ]);
    }

    /**
     * @Route("/new", name="blog_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $blog = new Blog();
        $form = $this->createForm(BlogType::class, $blog);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $file = $blog->getImage();

            $filename = md5(uniqid()).'.'.$file->guessExtension();
            $file->move($this->getParameter('upload_image_directory'), $filename);
            $blog->setImage($this->getParameter('upload_image_directory').'/'.$filename);
            $blog->setUser($this->getUser());

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($blog);
            $entityManager->flush();

            $this->addFlash('success', 'Blog is created. Enjoy your blogging !');

            return $this->redirectToRoute('blog_index');
        }

        return $this->render('blog/new.html.twig', [
            'blog' => $blog,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="blog_show", methods={"GET"})
     */
    public function show(Blog $blog): Response
    {
        return $this->render('blog/show.html.twig', [
            'blog' => $blog,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="blog_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Blog $blog): Response
    {
        $form = $this->createForm(BlogType::class, $blog);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('blog_index');
        }

        return $this->render('blog/edit.html.twig', [
            'blog' => $blog,
            'form' => $form->createView(),
        ]);
    }

    /**
     * @Route("/{id}", name="blog_delete", methods={"POST"})
     */
    public function delete(Request $request, Blog $blog): Response
    {
        if ($this->isCsrfTokenValid('delete'.$blog->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($blog);
            $entityManager->flush();
        }

        return $this->redirectToRoute('blog_index');
    }
}
