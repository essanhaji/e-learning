<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-US" lang="en-US">

<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <title>Educate - Education HTML Templates</title>

    <meta name="author" content="themesflat.com">

    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- Bootstrap  -->
    <link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap.css') }}">

    <!-- Theme Style -->
    <link rel="stylesheet" type="text/css" href="{{ asset('css/shortcodes.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/style.css') }}">


    <!-- Responsive -->
    <link rel="stylesheet" type="text/css" href="{{ asset('css/responsive.css') }}">

    <!-- Colors -->
    <link rel="stylesheet" type="text/css" href="{{ asset('css/colors/color1.css') }}" id="colors">

    <script type="text/javascript">
        var user_id_loged = '0';
        @auth
            user_id_loged = '{{ Auth::user()->id }}';
        @endauth
        console.log(user_id_loged);
    </script>

    <!-- Favicon and touch icons  -->
    <link href="{{ asset('icon/apple-touch-icon-48-precomposed.png') }}" rel="apple-touch-icon-precomposed" sizes="48x48">
    <link href="{{ asset('icon/apple-touch-icon-57-precomposed.png') }}" rel="apple-touch-icon-precomposed" sizes="57x57">
    <link href="{{ asset('icon/favicon.png') }}" rel="shortcut icon">

</head>

<body class="header-sticky">
    <div class="boxed">
        <div class="windows8">
            <div class="preload-inner">
                <div class="wBall" id="wBall_1">
                    <div class="wInnerBall"></div>
                </div>
                <div class="wBall" id="wBall_2">
                    <div class="wInnerBall"></div>
                </div>
                <div class="wBall" id="wBall_3">
                    <div class="wInnerBall"></div>
                </div>
                <div class="wBall" id="wBall_4">
                    <div class="wInnerBall"></div>
                </div>
                <div class="wBall" id="wBall_5">
                    <div class="wInnerBall"></div>
                </div>
            </div>
        </div>
        <div class="header-inner-pages">
            <div class="top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="text-information">
                                <p>
                                    <a href="/login">Login <i class="fa fa-sign-in" aria-hidden="true"></i></a>
                                    &nbsp;/&nbsp;
                                    <a href="/register">Register <i class="fa fa-user-plus" aria-hidden="true"></i></a>
                                </p>
                            </div>
                            <div class="right-bar">
                                <ul class="flat-information">
                                    <li class="phone">
                                        <a title="Phone number">+212 641 966 888</a>
                                    </li>
                                    <li class="email">
                                        <a title="Email address"> info@e-learning.com</a>
                                    </li>
                                </ul>
                                <ul class="flat-socials">
                                    <li class="facebook">
                                        <a>
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                    </li>
                                    <li class="twitter">
                                        <a>
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                    </li>
                                    <li class="linkedin">
                                        <a>
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </li>
                                    <li class="youtube">
                                        <a>
                                            <i class="fa fa-youtube-play"></i>
                                        </a>
                                    </li>
                                    <li class="instagram">
                                        <a>
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- /.header-inner-pages -->

        <!-- Header -->
        <header id="header" class="header clearfix">
            <div class="container">
                <div class="header-wrap clearfix">
                    <div id="logo" class="logo">
                        <a href="{{ url('/') }}" rel="home">
                            <img src="{{ asset('images/logo.png') }}" alt="E-learning">
                        </a>
                    </div><!-- /.logo -->
                    <div class="nav-wrap">
                        <div class="btn-menu">
                            <span></span>
                        </div><!-- //mobile menu button -->
                        <nav id="mainnav" class="mainnav">
                            <ul class="menu">
                                <li class="home">
                                    <a href="{{ url('/') }}">Home</a>
                                </li>

                                <li>
                                    <a href="{{ url('/courses') }}">Courses</a>
                                </li>

                                <li>
                                    <a href="{{ url('/teachers') }}">Teachers</a>
                                </li>

                                <li>
                                    <a href="{{ url('/blog') }}">Blog</a>
                                </li>

                                <li class="has-sub">
                                    <a href="{{ url('/about-us') }}">About Us</a>
                                    <span class="btn-submenu"></span>
                                    <ul class="submenu">
                                        <li><a href="{{ url('/faqs') }}">FAQs</a></li>
                                        <li><a href="{{ url('/events') }}">Events</a></li>
                                    </ul>
                                </li>

                                <li>
                                    <a href="{{ url('/contact') }}">Contact</a>
                                </li>
                            </ul><!-- /.menu -->
                        </nav><!-- /.mainnav -->
                    </div><!-- /.nav-wrap -->

                    <div id="s" class="show-search">
                        <a><i class="fa fa-search"></i></a>
                    </div><!-- /.show-search -->

                    <div class="submenu top-search">
                        <div class="widget widget_search">
                            <form class="search-form" method="POST" action="{{ url('courses') }}">
                                @csrf
                                <input type="search" class="search-field" name="search" placeholder="Search …" required>
                                <input type="submit" class="search-submit">
                            </form>
                        </div>
                    </div>
                </div><!-- /.header-inner -->
            </div>
        </header><!-- /.header -->

        @yield('content')

        <!-- Footer -->
        <footer class="footer">
            <div class="footer-widgets">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="widget widget-text">
                                <img src="{{ asset('images/blog/Footer-01.jpg') }}" alt="E-learning">
                                <ul>
                                    <li class="address">68 Tran Hana Dao, Data Center, KBM</li>
                                    <li class="phone"><a>+212 641 966 888</a></li>
                                    <li class="email"><a href="contact@e-learning.com">contact@e-learning.com</a></li>
                                </ul>
                            </div><!-- /.widget -->
                        </div>

                        <div class="col-md-3">
                            <div class="widget widget_tweets clearfix">
                                <h5 class="widget-title">Quick Links</h5>
                                <ul class="link-left">
                                    <li>
                                        <a href="{{ url('/') }}">Home</a>
                                    </li>
                                    <li>
                                        <a href="{{ url('/about-us') }}">About Us</a>
                                    </li>
                                    <li>
                                        <a href="{{ url('/blog') }}">Blog</a>
                                    </li>
                                    <li>
                                        <a href="{{ url('/contact') }}">Contact</a>
                                    </li>
                                    <li>
                                        <a href="{{ url('/courses') }}">Courses</a>
                                    </li>

                                </ul>
                                <ul class="link-right">
                                    <li>
                                        <a href="{{ url('/teachers') }}">Teachers</a>
                                    </li>
                                    <li>
                                        <a href="{{ url('/faqs') }}">FAQs</a>
                                    </li>
                                    <li>
                                        <a href="{{ url('/events') }}">Events</a>
                                    </li>
                                    <li>
                                        <a href="{{ url('/teachers') }}">Become a Teacher</a>
                                    </li>

                                </ul>
                            </div><!-- /.widget-recent-tweets -->
                        </div><!-- /.col-md-2 -->

                        <div class="col-md-3">
                            <div class="widget widget_recent-courses">
                                <h5 class="widget-title">Recent Courses</h5>
                                <ul class="recent-courses-news clearfix">

                                @foreach($coursTows as $coursTow)
                                <li>
                                    <div class="thumb">
                                        <img src="{{ asset('storage/'.$coursTow->image) }}" alt="{{ $coursTow->title }}" width="110px">
                                    </div>
                                    <div class="text">
                                        <a href="{{ url('courses/'.$coursTow->slug) }}">{{ $coursTow->title }}</a>
                                    </div>
                                    <div class="review-rating">
                                        <ul>

                                            @for($i=1; $i<=5; $i++) @if($i <=$coursTow->rate())
                                                <li class="star">
                                                    <a><i class="fa fa-star"></i></a>
                                                </li>
                                                @else
                                                <li class="star">
                                                    <a><i class="fa fa-star-o"></i></a>
                                                </li>
                                                @endif
                                            @endfor

                                        </ul>
                                    </div>
                                </li>
                                @endforeach

                                </ul>
                            </div><!-- /.widget-quick-contact -->
                        </div><!-- /.col-md-4-->

                        <div class="col-md-3">
                            <div class="widget widget-quick-contact">
                                <h5 class="widget-title">Quick Contact</h5>
                                <div class="row">
                                    <div class="col-md-12" id="footerFormContact">
                                        <div v-if="etat" id="subscribe-msg">
                                            <div class="alert alert-success" role="alert">
                                                <strong>@{{ succes }}</strong>
                                            </div>
                                        </div>  
                                        <form class="flat-contact-form" id="contactform" method="post" @submit.prevent="addMessage">

                                            <input v-validate="'required|email'" tabindex="2" type="email" id="email-contact" name="email" placeholder="Your Email Here" v-model="contact.email">
                                            <div v-show="errors.has('email')" class="invalid-feedback">
                                                <i v-show="errors.has('email')" class="fa fa-warning"></i>    
                                                @{{ errors.first('email') }}
                                            </div>

                                            <textarea  v-validate="'required|min:10|max:600'" class="type-input" tabindex="2" placeholder="Message" name="message" id="message-contact" v-model="contact.message"></textarea>
                                            
                                            <div class="submit-wrap">
                                                <button class="flat-button bg-orange" type="submit">
                                                    <i class="fa fa-long-arrow-right"></i>
                                                </button>
                                            </div>
                                        
                                        </form><!-- /.comment-form -->
                                        <div v-show="errors.has('message')" class="invalid-feedback">
                                            <i v-show="errors.has('message')" class="fa fa-warning"></i>    
                                            @{{ errors.first('message') }}
                                        </div> 
                                    </div><!-- /.col-md-12 -->
                                </div>
                            </div><!-- /.widget .widget-instagram -->
                        </div>
                    </div><!-- /.row -->
                </div><!-- /.container -->
            </div><!-- /.footer-widgets -->
        </footer>

        <a class="go-top">
            <i class="fa fa-chevron-up"></i>
        </a>

        <!-- Bottom -->
        <div class="bottom">
            <div class="container">
                <ul class="flat-socials-v1">
                    <li class="facebook">
                        <a><i class="fa fa-facebook"></i></a>
                    </li>
                    <li class="twitter">
                        <a><i class="fa fa-twitter"></i></a>
                    </li>
                    <li class="vimeo">
                        <a><i class="fa fa-linkedin"></i></a>
                    </li>
                    <li class="rss">
                        <a><i class="fa fa-youtube-play"></i></a>
                    </li>
                </ul>
                <div class="row">
                    <div class="container-bottom">
                        <div class="copyright">
                            <p>Copyright © 2019. Designer by <span><a>KBM-CONSULTING</a></span>. All Rights Reserved.</p>
                        </div>
                    </div><!-- /.container-bottom -->
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div>
    </div><!-- /. boxed -->


    <!-- Javascript -->
    <script type="text/javascript" src="{{ asset('js/jquery.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/bootstrap.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/jquery.easing.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/owl.carousel.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/jquery-waypoints.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/jquery-countTo.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/parallax.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/jquery.cookie.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/jquery-validate.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/main.js') }}"></script>

    <!-- Revolution Slider -->
    <script type="text/javascript" src="{{ asset('js/jquery.themepunch.tools.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/jquery.themepunch.revolution.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/slider.js') }}"></script>

    <!-- vue js -->
    <script type="text/javascript" src="{{ asset('js/vue.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/vee-validate.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/axios.js') }}"></script>

    <script>
        Vue.use(VeeValidate); // good to go.
        window.Laravel = {!!json_encode([
            'csrfToken' => csrf_token(),
            'url'       => url('/'),
            'course_id' => '',
            'user' => '',
        ]) !!}
    </script>

    <script type="text/javascript" src="{{ asset('js/vue/indexFooterFormContact.js') }}"></script>

    <!-- our script vue js -->
    @yield('js')

</body>

</html>