<?php

namespace App\Controller;

use App\Entity\Blog;
use App\Form\BlogType;
use App\Repository\BlogRepository;
use App\Repository\CommentsRepository;
use Psr\Log\LoggerInterface;
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
     * @var LoggerInterface
     */
    private $appLogger;

    public function __construct(LoggerInterface $appLogger)
    {
        $this->appLogger = $appLogger;
    }

    /**
     * @Route("/", name="blog_index", methods={"GET"})
     * @param BlogRepository $blogRepository
     * @return Response
     */
    public function index(BlogRepository $blogRepository): Response
    {
        $this->appLogger->info('Go to all blogs.');

        return $this->render('blog/index.html.twig', [
            'blogs' => $blogRepository->findAll(),
        ]);
    }

    /**
     * @Route("/blog_category/{category}", name="blog_category", methods={"GET"})
     *
     * @param $category
     * @param BlogRepository $blogRepository
     * @return Response
     */
    public function category($category, BlogRepository $blogRepository): Response
    {
        $this->appLogger->info('Go to category blogs.');

        return $this->render('blog/category.html.twig', [
            'blogs' => $blogRepository->findBy(['category' => $category]),
        ]);
    }

    /**
     * @Route("/blog_details/{blog}", name="blog_details", methods={"GET"})
     * @param Blog $blog
     * @param BlogRepository $blogRepository
     * @param CommentsRepository $commentrepositorty
     * @return Response
     */
    public function blog_details(Blog $blog, BlogRepository $blogRepository, CommentsRepository $commentrepositorty): Response
    {
        $this->appLogger->info('Go to blog details.');

        return $this->render('blog/blogdetails.html.twig', [
            'blogs' => $blogRepository->findBy(['id' => $blog]),
            'comments' => $commentrepositorty->findBy(['blog' => $blog]),
        ]);
    }

    /**
     * @Route("/blog_filter_date", name="blog_filter_date", methods={"GET","POST"})
     * @param BlogRepository $blogRepository
     * @param Request $request
     * @return Response
     */
    public function filter_date(BlogRepository $blogRepository, Request $request): Response
    {
        $this->appLogger->info('Go to date wise blogs.');

        $date1 = $request->get('datepicker');
        $blogs = $blogRepository->findByDate($date1);

        return $this->render('blog/date.html.twig', [
            'blogs' => $blogs,
        ]);
    }

    /**
     * @Route("/all_user_blog", name="all_user_blog", methods={"GET"})
     * @param BlogRepository $blogRepository
     * @return Response
     */
    public function all_user_blog(BlogRepository $blogRepository): Response
    {
        $this->appLogger->info('Go to all blogs according to user.');

        $user = $this->getUser();

        return $this->render('blog/allblog.html.twig', [
            'blogs' => $blogRepository->findBy(['user' => $user]),
        ]);
    }

    /**
     * @Route("/new", name="blog_new", methods={"GET","POST"})
     * @param Request $request
     * @return Response
     */
    public function new(Request $request): Response
    {
        $this->appLogger->info('Go to add new blog.');

        $blog = new Blog();
        $form = $this->createForm(BlogType::class, $blog);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $file = $form->get('image')->getData();

            $filename = md5(uniqid()).'.'.$file->guessExtension();
            $file->move($this->getParameter('upload_image_directory'), $filename);
            $blog->setImage($this->getParameter('upload_image_directory').'/'.$filename);
            $blog->setUser($this->getUser());

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($blog);
            $entityManager->flush();

            $this->addFlash('success', 'Blog is created. Enjoy your blogging !');

            return $this->redirectToRoute('all_user_blog');
        }

        return $this->render('blog/new.html.twig', [
            'blog' => $blog,
            'form' => $form->createView(),
        ]);
    }

//    /**
//     * @Route("/{id}", name="blog_show", methods={"GET"})
//     */
//    public function show(Blog $blog): Response
//    {
//        return $this->render('blog/show.html.twig', [
//            'blog' => $blog,
//        ]);
//    }
//
//    /**
//     * @Route("/{id}/edit", name="blog_edit", methods={"GET","POST"})
//     */
//    public function edit(Request $request, Blog $blog): Response
//    {
//        $form = $this->createForm(BlogType::class, $blog);
//        $form->handleRequest($request);
//
//        if ($form->isSubmitted() && $form->isValid()) {
//            $this->getDoctrine()->getManager()->flush();
//
//            return $this->redirectToRoute('blog_index');
//        }
//
//        return $this->render('blog/edit.html.twig', [
//            'blog' => $blog,
//            'form' => $form->createView(),
//        ]);
//    }
//
//    /**
//     * @Route("/{id}", name="blog_delete", methods={"POST"})
//     */
//    public function delete(Request $request, Blog $blog): Response
//    {
//        if ($this->isCsrfTokenValid('delete'.$blog->getId(), $request->request->get('_token'))) {
//            $entityManager = $this->getDoctrine()->getManager();
//            $entityManager->remove($blog);
//            $entityManager->flush();
//        }
//
//        return $this->redirectToRoute('blog_index');
//    }
}
