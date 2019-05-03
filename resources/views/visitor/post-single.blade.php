@extends('visitor.layout')
@section('content')

        <div class="page-title parallax parallax4"> 
        	<div class="overlay"></div>            
            <div class="container">
                <div class="row">
                    <div class="col-md-12">                    
                        <div class="page-title-heading">
                            <h2 class="title">{{ $post->title }}</h2>
                        </div><!-- /.page-title-heading -->
                        <div class="breadcrumbs">
                            <ul>
                                <li><a href="{{ url('/') }}">Home</a></li>
                                <li>Post</li>
                            </ul>                   
                        </div><!-- /.breadcrumbs --> 
                    </div><!-- /.col-md-12 -->  
                </div><!-- /.row -->  
            </div><!-- /.container -->                      
        </div><!-- /page-title parallax -->
    	
        <section class="main-content blog-posts style-v1">
            <div class="container">
                <div class="row">
                    <div class="col-md-8">
                        <div class="blog-title-single">
                            <h1 class="bold">{{ $post->title }}</h1>
                            <article class="entry clearfix">
                                <div class="entry-border">
                                    <div class="main-post">
                                        <div class="wrap-img">
                                            <img width="100px" src="{{ asset('storage/'.$post->user->avatar) }}" alt="{{ $post->user->name }}">
                                            <h6>{{ $post->user->name }}</h6>
                                            <div class="entry-meta">
                                            @php
                                                $date0 = explode(' ',$post->updated_at);
                                                $date = explode('-',$date0[0]);
                                                $M= $date[1];
                                                $D = $date[2];
                                                $Y = $date[0];
                                                $dateObj = DateTime::createFromFormat('!m', $M);
                                                $monthName = $dateObj->format('F')
                                            @endphp
                                                <span class="date"><a>{{ $D }} &nbsp; {{ $monthName }}, {{ $Y }}</a></span>
                                                <span class="comment"><a>{{ $post->nbrComents() }} comments</a></span>
                                                <span class="tag"><a href="{{ url('blog/category/'.$post->category->slug) }}">{{ $post->category->name }}</a></span>
                                            </div>
                                        </div>  
                                        
                                        <div class="feature-post">
                                            <img src="{{ asset('storage/'.$post->image) }}" alt="{{ $post->title }}">
                                        </div><!-- /.feature-post -->
                                        <div class="entry-content">
                                            <p>
                                                {!! $post->body !!}
                                            </p>                                   
                                        </div><!-- /.entry-post -->

                                    </div><!-- /.main-post -->
                                    <!-- Wrap-share -->
                                    <div class="wrap-share">
                                        <div class="share-post">  
                                            <h4>Share:</h4>                                 
                                            <ul class="flat-socials">
                                                <li class="twitter">
                                                    <a href="blog-single.html#"><i class="fa fa-twitter"></i></a>
                                                </li>
                                                <li class="facebook">
                                                    <a href="blog-single.html#"><i class="fa fa-facebook"></i></a>
                                                </li>
                                                <li class="google">
                                                    <a href="blog-single.html#"><i class="fa fa-google" aria-hidden="true"></i></a>
                                                </li>
                                                <li class="instagram">
                                                    <a href="blog-single.html#"><i class="fa fa-instagram"></i></a>
                                                </li>
                                                <li class="pinterest">
                                                    <a href="blog-single.html#"><i class="fa fa-pinterest-p"></i></a>
                                                </li>
                                            </ul><!-- /flat-socials -->
                                        </div><!-- /.share-post -->      
                                    </div><!-- /.wrap-share -->
                                </div><!-- /.entry-border -->
                            </article><!-- /entry clearfix -->

                            <div class="comment-post">
                                <div class="comment-list-wrap">
                                    <h4 class="title comment-title">Comment (3) </h4>
                                    <ul class="comment-list">
                                        <li>
                                            <article class="comment">
                                                <div class="comment-avatar">
                                                    <img src="images/blog/1singlev1.png" alt="image">
                                                </div>                  
                                                <div class="comment-detail">
                                                    <div class="comment-meta">
                                                        <p class="comment-author"><a href="blog-single.html#">Marie Morales</a></p> 
                                                        <p class="comment-date"><a href="blog-single.html">March 8, 2016 - 8:00am</a></p> 
                                                    </div>

                                                    <p class="comment-body">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore</p>
                                                    <a href="blog-single.html#" class="comment-reply">Reply</a>
                                                </div><!-- /.comment-detail -->
                                            </article><!-- /.comment -->
                                        </li>

                                         <li>
                                            <article class="comment style1">
                                                <div class="comment-avatar">
                                                    <img src="images/blog/2singlev1.png" alt="image">
                                                </div>                  
                                                <div class="comment-detail">
                                                    <div class="comment-meta">
                                                        <p class="comment-author"><a href="blog-single.html#">Terry Moore</a></p> 
                                                        <p class="comment-date"><a href="blog-single.html">March 8, 2016 - 8:00am</a></p> 
                                                        
                                                    </div>
                                                    <p class="comment-body">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore</p>
                                                    <a href="blog-single.html#" class="comment-reply">Reply</a>
                                                </div><!-- /.comment-detail -->
                                            </article><!-- /.comment -->
                                        </li>

                                         <li>
                                            <article class="comment no-border">
                                                <div class="comment-avatar">
                                                    <img src="{{ asset('images/blog/3singlev1.png') }}" alt="image">
                                                </div>                  
                                                <div class="comment-detail">
                                                    <div class="comment-meta">
                                                        <span class="comment-author"><a href="blog-single.html#">Quetta Lee</a></span> 
                                                        <p class="comment-date"><a href="blog-single.html">March 8, 2016 - 8:00am</a></p> 
                                                        
                                                    </div>
                                                    <p class="comment-body">Sed ut perspiciatis unde omnis iste natus sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore</p>
                                                    <a href="blog-single.html#" class="comment-reply">Reply</a>
                                                </div><!-- /.comment-detail -->
                                            </article><!-- /.comment -->
                                        </li>
                                    </ul><!-- /.comment-list -->
                                </div><!-- /.comment-list-wrap -->

                                <div id="respond" class="comment-respond">
                                    <h4 class="title comment-title style1">Leave a comment</h4>
                                    <p>Your email address will not be published. Required fields are marked *</p>
                                    <form class="flat-contact-form" id="contactform5" method="post" action="http://themesflat.com/html/educate/contact/contact-process.php">
                                    
                                        <input type="text" value="" tabindex="1" placeholder="Name*" name="name" id="name" required="" style="">
                                        
                                        <input type="email" value="" tabindex="2" placeholder="Email" name="email" id="email-contact" required="">

                                        <textarea class="type-input" tabindex="3" placeholder="Comment*" name="message" id="message-contact" required=""></textarea>
                                
                                        <button class="flat-button bg-orange">Post Comment</button>
                           
                                    </form>
                                </div><!-- /#respond -->
                            </div><!-- /.comment-post -->
                        </div><!-- /blog-title-single -->
                    </div><!-- /col-md-8 -->



                    <div class="sidebar">
            <div class="widget widget-categories">
                <h5 class="widget-title">Categories</h5>
                <ul>
                    <li>
                        <a href="{{ url('blog/') }}" @if($categoryIdActive=='' ) style="color: #ffaa30;" @endif>All Posts</a>
                        <span class="badge" style="background-color: #ffaa30; color:white;">{{ $blog->count() }}</span>
                    </li>
                    @foreach($categories as $category)
                    <li>
                        <a href="{{ url('blog/category/'.$category->slug) }}" @if($categoryIdActive=='' .$category->id) style="color: #ffaa30;" @endif>{{ $category->name }}</a>
                        <span class="badge" style="background-color: #ffaa30; color:white;">{{ $category->posts->count() }}</span>
                    </li>
                    @endforeach
                </ul>
            </div>



            <div class="widget widget-popular-news">
                <h5 class="widget-title">Recent posts</h5>
                <ul class="popular-news clearfix">
                    @foreach($lastPosts as $lastPost)
                    <li>
                        <div class="thumb">
                            <img width="100px" src="{{ asset('storage/'.$lastPost->image) }}" alt="{{ $lastPost->title }}">
                        </div>
                        @php
                        $date0 = explode(' ',$lastPost->updated_at);
                        $date = explode('-',$date0[0]);
                        $M= $date[1];
                        $D = $date[2];
                        $Y = $date[0];
                        $dateObj = DateTime::createFromFormat('!m', $M);
                        $monthName = $dateObj->format('F')
                        @endphp
                        <div class="text">
                            <a href="{{ url('blog/'.$lastPost->slug) }}">{{ str_limit($lastPost->title, 28) }}</a>
                            <p>{{ $monthName }} &nbsp; {{ $D }}, {{ $Y }} </p>
                        </div>
                    </li>
                    @endforeach
                </ul><!-- /popular-news clearfix -->
            </div><!-- /widget widget-popular-news -->


            <div class="widget widget-featured-courses">
                <h5 class="widget-title">Best courses</h5>
                <ul class="featured-courses-news clearfix">
                    @foreach($bestPriceCourses as $bestPriceCourse)
                    <li>
                        <div class="thumb">
                            <img src="{{ asset('storage/'.$bestPriceCourse->image) }}" alt="{{ $bestPriceCourse->title }}" width="105px">
                        </div>
                        <div class="text">
                            <a href="{{ url('courses/'.$bestPriceCourse->slug) }}" title="{{ $bestPriceCourse->title }}">{{ str_limit($bestPriceCourse->title, 18) }}</a>
                            <p>{{ $bestPriceCourse->teacher->user->name }}</p>
                        </div>
                        <div class="review-rating">
                            <div class="flat-money">
                                <p>{{ $bestPriceCourse->price }} DH</p>
                            </div>
                            <div class="flat-money" style="background-color: #ffaa30;">
                                <a href="{{ url('courses/'.$bestPriceCourse->slug) }}">
                                    <p>+</p>
                                </a>
                            </div>

                        </div>
                    </li>
                    @endforeach

                </ul><!-- /popular-news clearfix -->
            </div><!-- /widget widget-popular-news -->
        </div><!-- /sidebar -->




                </div><!-- /row -->
            </div><!-- /container -->
        </section><!-- /main-content -->


@endsection