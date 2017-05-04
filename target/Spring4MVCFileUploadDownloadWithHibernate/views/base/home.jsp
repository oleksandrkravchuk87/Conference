<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 21.09.2016
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Homepage</title>
    <style type="text/css">

        .inviteText {
        background-color: white;
        color: rgb(102, 102, 102);
        font-size: 16px;
        padding: 5px
        }

        .leftimg {
            float:left;
            margin: 7px 7px 7px 0;
        }
        .topic p {
            text-align: left;
        }

        #slideshow #slideshowWindow {
            width:1000px;
            height:300px;
            margin:0;
            padding:0;
            position:relative;
            overflow:hidden;
        }

        #slideshow #slideshowWindow .slide {
            margin:0;
            padding:0;
            width:1000px;
            height:200px;
            position:relative;
        }

        #slideshow #slideshowWindow .slide .slideText {
            position:absolute;
            top:215px;
            left:0px;
            width:100%;
            height:100px;
            background-image:url("/resources/images/greyBg.png");
            background-repeat:repeat;
            margin:0;
            padding:0;
            color:white;
        }

        #slideshow #slideshowWindow .slide .slideText a:link, #slideshow #slideshowWindow .slide .slideText a:visited {
            color:white;
            text-decoration:none;
        }

        #slideshow #slideshowWindow .slide .slideText h2, #slideshow #slideshowWindow .slide .slideText p {
            margin:10px 0 0 10px;
            padding:0;
        }


        .nav {
            display:block;
            text-indent:-10000px;
            position:absolute;
            cursor:pointer;
        }

        #leftNav {
            top:200px;
            left:350px;
            width:34px;
            height:70px;
            background-image:url("/resources/images/left.png");
            background-repeat:no-repeat;
            z-index:999;
        }

        #rightNav {
            top:200px;
            left:450px;
            width:34px;
            height:70px;
            background-image:url("/resources/images/right.png");
            background-repeat:no-repeat;
            z-index:999;
        }

        #toTop {

            position:fixed;
            bottom:25px;
            right:25px;
            cursor:pointer;
            display:none;
        }

    </style>

    <%--"slideshow" script--%>
    <script type="text/javascript">
        $(window).ready(function() {

            var currentPosition = 0;
            var slideWidth = 1000;
            var slides = $('.slide');
            var numberOfSlides = slides.length;
            var slideShowInterval;
            var speed = 7000;

            //Assign a timer, so it will run periodically
            slideShowInterval = setInterval(changePosition, speed);

            slides.wrapAll('<div id="slidesHolder"></div>')

            slides.css({ 'float' : 'left' });

            //#slidesHolder width is equal to the total width of all the slides
            $('#slidesHolder').css('width', slideWidth * numberOfSlides);

            $('#slideshow')
                    .prepend('<div class="nav" id="leftNav">Move Left</div>')
                    .append('<div class="nav" id="rightNav">Move Right</div>');

            manageNav(currentPosition);

            //what to do when clicked
            $('.nav').bind('click', function() {

                //determining of a new position
                currentPosition = ($(this).attr('id')=='rightNav')
                        ? currentPosition+1 : currentPosition-1;

                //hide/show controls
                manageNav(currentPosition);
                clearInterval(slideShowInterval);
                slideShowInterval = setInterval(changePosition, speed);
                moveSlide();
            });

            function manageNav(position) {
                //hide left arrow if position is first slide
                if(position==0){ $('#leftNav').hide() }
                else { $('#leftNav').show() }
                //hide right arrow is slide position is last slide
                if(position==numberOfSlides-1){ $('#rightNav').hide() }
                else { $('#rightNav').show() }
            }


            //changePosition: this is called when the slide is moved by the timer and NOT when the next or previous buttons are clicked
            function changePosition() {
                if(currentPosition == numberOfSlides - 1) {
                    currentPosition = 0;
                    manageNav(currentPosition);
                } else {
                    currentPosition++;
                    manageNav(currentPosition);
                }
                moveSlide();
            }

            //moveSlide: this function moves the slide
            function moveSlide() {
                $('#slidesHolder').animate({'marginLeft' : slideWidth*(-currentPosition)});
            }
        });
            /*go to the top button*/
        $(function() {
            $(window).scroll(function() {
                if($(this).scrollTop() != 0) {
                    $('#toTop').fadeIn();
                } else {
                    $('#toTop').fadeOut();
                }
            });
            $('#toTop').click(function() {
               $('body,html').animate({scrollTop:0},800);
            });
        });
    </script>
</head>
<body>
<img>

<%--slideshow--%>
<div style="background-color: white;
margin: 0 auto;">
    <div id="slideshow">
        <div id="slideshowWindow">
            <div class="slide">
                <img src="/resources/images/slide1_1000x300.jpeg" />
                <div class="slideText">
                    <h2 class="slideTitle">Electronics</h2>
                    <p class="slideDes"> Recent research</p>
                    <p class="slideLink"><a href="#topic1">more about...</a></p>
                </div><!--/slideText-->
            </div><!--/slide-->
            <div class="slide">
                <img src="/resources/images/slide2_1000x300.jpeg" />
                <div class="slideText">
                    <h2 class="slideTitle">Microbiology</h2>
                    <p class="slideDes"> </p>
                    <p class="slideLink"><a href="#topic2">more about...</a></p>
                </div><!--/slideText-->
            </div><!--/slide-->
            <div class="slide">
                <img src="/resources/images/slide3_1000x300.jpeg" />
                <div class="slideText">
                    <h2 class="slideTitle">Nanomedicine</h2>
                    <p class="slideDes"></p>
                    <p class="slideLink"><a href="#topic3">more about...</a></p>
                </div><!--/slideText-->
            </div><!--/slide-->
            <div class="slide">
                <img src="/resources/images/slide4_1000x300.jpg" />
                <div class="slideText">
                    <h2 class="slideTitle">Nanomaterials</h2>
                    <p class="slideDes"></p>
                    <p class="slideLink"><a href="#topic4">more about...</a></p>
                </div><!--/slideText-->
            </div><!--/slide-->
        </div><!--/slideshowWindow-->
    </div><!--/slideshow-->
</div>

<%--invitation and topics--%>
<div class="inviteText">
    <div>
<p>We Are Pleased to Invite You to Attend the.......</p>
    </div>
    <hr/>
    <div id="topic1" class="topic">
        <h3>Electronics</h3>
        <img src="/resources/images/electronic300x225.jpg"  width="300" height="225" class="leftimg"/>
        <p>
            Electronics is the science of controlling electrical energy electrically, in which the electrons have a fundamental role. Electronics deals with electrical circuits that involve active electrical components such as vacuum tubes, transistors, diodes, integrated circuits, associated passive electrical components, and interconnection technologies. Commonly, electronic devices contain circuitry consisting primarily or exclusively of active semiconductors supplemented with passive elements; such a circuit is described as an electronic circuit.
            The science of electronics is also considered to be a branch of physics and electrical engineering.
            </p>
        <p>
            The nonlinear behaviour of active components and their ability to control electron flows makes amplification of weak signals possible, and electronics is widely used in information processing, telecommunication, and signal processing. The ability of electronic devices to act as switches makes digital information processing possible. Interconnection technologies such as circuit boards, electronics packaging technology, and other varied forms of communication infrastructure complete circuit functionality and transform the mixed components into a regular working system.
            Electronics is distinct from electrical and electro-mechanical science and technology, which deal with the generation, distribution, switching, storage, and conversion of electrical energy to and from other energy forms using wires, motors, generators, batteries, switches, relays, transformers, resistors, and other passive components. This distinction started around 1906 with the invention by Lee De Forest of the triode, which made electrical amplification of weak radio signals and audio signals possible with a non-mechanical device. Until 1950 this field was called "radio technology" because its principal application was the design and theory of radio transmitters, receivers, and vacuum tubes.
            Today, most electronic devices use semiconductor components to perform electron control. The study of semiconductor devices and related technology is considered a branch of solid-state physics, whereas the design and construction of electronic circuits to solve practical problems come under electronics engineering. This article focuses on engineering aspects of electronics.
        </p>
        <hr/>

    </div>
    <div id="topic2" class="topic">
        <h3>Microbiology</h3>
        <img src="/resources/images/micro300x225.jpg"  width="300" height="225" class="leftimg"/>
        <p>
            Microbiology is the study of microscopic organisms, those being unicellular (single cell), multicellular (cell colony), or acellular (lacking cells). Microbiology encompasses numerous sub-disciplines including virology, mycology, parasitology, and bacteriology.
            Eukaryotic micro-organisms possess membrane-bound cell organelles and include fungi and protists, whereas prokaryotic organisms—all of which are microorganisms—are conventionally classified as lacking membrane-bound organelles and include eubacteria and archaebacteria. Microbiologists traditionally relied on culture, staining, and microscopy. However, less than 1% of the microorganisms present in common environments can be cultured in isolation using current means. Microbiologists often rely on extraction or detection of nucleic acid, either DNA or RNA sequences.
            Viruses have been variably classified as organisms, as they have been considered either as very simple microorganisms or very complex molecules. Prions, never considered microorganisms, have been investigated by virologists, however, as the clinical effects traced to them were originally presumed due to chronic viral infections, and virologists took search—discovering "infectious proteins".
            The existence of microorganisms was predicted many centuries before they were first observed, for example by the Jains in India and by Marcus Terentius Varro in ancient Rome. The first recorded microscope observation was of the fruiting bodies of moulds, by Robert Hooke in 1666, but the Jesuit priest Athanasius Kircher was likely the first to see microbes, which he mentioned observing in milk and putrid material in 1658. Antonie van Leeuwenhoek is considered a father of microbiology as he observed and experimented with microscopic organisms in 1676, using simple microscopes of his own design. Scientific microbiology developed in the 19th century through the work of Louis Pasteur and in medical microbiology Robert Koch.
        </p>
        <hr/>
    </div>
    <div id="topic3" class="topic">
        <h3>Nanomedicine</h3>
        <img src="/resources/images/nanomed300x225.jpg"  width="300" height="225" class="leftimg"/>
        <p>
            Nanomedicine is the medical application of nanotechnology. Nanomedicine ranges from the medical applications of nanomaterials and biological devices, to nanoelectronic biosensors, and even possible future applications of molecular nanotechnology such as biological machines. Current problems for nanomedicine involve understanding the issues related to toxicity and environmental impact of nanoscale materials (materials whose structure is on the scale of nanometers, i.e. billionths of a meter).
            Functionalities can be added to nanomaterials by interfacing them with biological molecules or structures. The size of nanomaterials is similar to that of most biological molecules and structures; therefore, nanomaterials can be useful for both in vivo and in vitro biomedical research and applications. Thus far, the integration of nanomaterials with biology has led to the development of diagnostic devices, contrast agents, analytical tools, physical therapy applications, and drug delivery vehicles.
            Nanomedicine seeks to deliver a valuable set of research tools and clinically useful devices in the near future. The National Nanotechnology Initiative expects new commercial applications in the pharmaceutical industry that may include advanced drug delivery systems, new therapies, and in vivo imaging. Nanomedicine research is receiving funding from the US National Institutes of Health Common Fund program, supporting four nanomedicine development centers.
            Nanomedicine sales reached $16 billion in 2015, with a minimum of $3.8 billion in nanotechnology R&D being invested every year. Global funding for emerging nanotechnology increased by 45% per year in recent years, with product sales exceeding $1 trillion in 2013. As the nanomedicine industry continues to grow, it is expected to have a significant impact on the economy.
        </p>
        <hr/>
    </div>
    <div id="topic4" class="topic">
        <h3>Nanomaterials</h3>
        <img src="/resources/images/nano300x225.jpg" width="300" height="225" class="leftimg" />
        <p>
            Nanomaterials describe, in principle, materials of which a single unit is sized (in at least one dimension) between 1 and 1000 nanometres (10−9 meter) but is usually 1—100 nm (the usual definition of nanoscale).
            Nanomaterials research takes a materials science-based approach to nanotechnology, leveraging advances in materials metrology and synthesis which have been developed in support of microfabrication research. Materials with structure at the nanoscale often have unique optical, electronic, or mechanical properties.
            Nanomaterials are slowly becoming commercialized and beginning to emerge as commodities.
            Biological systems often feature natural, functional nanomaterials. The structure of foraminifera (mainly chalk) and viruses (protein, capsid), the wax crystals covering a lotus or nasturtium leaf, spider and spider-mite silk, the blue hue of tarantulas, the "spatulae" on the bottom of gecko feet, some butterfly wing scales, natural colloids (milk, blood), horny materials (skin, claws, beaks, feathers, horns, hair), paper, cotton, nacre, corals, and even our own bone matrix are all natural organic nanomaterials.
            Natural inorganic nanomaterials occur through crystal growth in the diverse chemical conditions of the Earth's crust. For example, clays display complex nanostructures due to anisotropy of their underlying crystal structure, and volcanic activity can give rise to opals, which are an instance of a naturally occurring photonic crystals due to their nanoscale structure. Fires represent particularly complex reactions and can produce pigments, cement, fumed silica etc.
        </p>

    </div>
</div>
<img id = "toTop" src="/resources/images/up.png"> </img>
</body>
</html>
