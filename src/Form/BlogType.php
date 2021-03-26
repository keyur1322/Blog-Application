<?php

namespace App\Form;

use App\Entity\Blog;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;

class BlogType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('title')
            ->add('short_description')
            ->add('long_description')
            ->add('date')
            ->add('category', ChoiceType::class, [
                'choices' => [
                  
                        'Technology' => 'technology',
                        'Science' => 'science',
                        'Medical' => 'medical',
                        'Food' => 'food',
                    ]])
            ->add('image', FileType::class)
          
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Blog::class ,
        ]);
    }
}
