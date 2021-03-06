<?php

namespace App\Controller;

use Psr\Log\LoggerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

/**
 * Class SecurityController.
 */
class SecurityController extends AbstractController
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
     * @Route("/login", name="app_login")
     * @param AuthenticationUtils $authenticationUtils
     * @return Response
     */
    public function login(AuthenticationUtils $authenticationUtils): Response
    {
        $this->appLogger->info('Go to login.');

        // get the login error if there is one
        $error = $authenticationUtils->getLastAuthenticationError();
        // last username entered by the user
        $lastUsername = $authenticationUtils->getLastUsername();

        $this->addFlash('success', 'Login Successfully !');

        return $this->render('security/login.html.twig', ['last_username' => $lastUsername, 'error' => $error]);
    }

    /**
     * @Route("/logout", name="app_logout")
     */
    public function logout(): \Symfony\Component\HttpFoundation\RedirectResponse
    {
        $this->appLogger->info('Logout User.');

        $this->addFlash('success', 'Logout Successfully !');

        //throw new \Exception('This method can be blank - it will be intercepted by the logout key on your firewall');
        return $this->redirect($this->generateUrl('blog_index'));
    }
}
