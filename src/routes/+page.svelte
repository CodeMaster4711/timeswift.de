<script>
  import BentoGrid from '$lib/components/home/BentoGrid.svelte';
  import Animated from '$lib/components/home/Animated.svelte';
  import Feature from '$lib/components/home/Feature.svelte';
  import AnimatedSplitText from '$lib/components/home/AnimatedSplitText.svelte';
  import QuoteSection from '$lib/components/home/QuoteSection.svelte';
  import AnyPlatform from '$lib/components/home/AnyPlatform.svelte';
 
  import gsap from 'gsap';
  import { ScrollTrigger } from 'gsap/ScrollTrigger';
  
  $effect(() => {
    gsap.registerPlugin(ScrollTrigger);
    // Einfache Animation für die Hero-Section
    const tl = gsap.timeline();
    tl.from('.hero-title', { 
      y: 30, 
      opacity: 0, 
      duration: 1,
      ease: 'power3.out'
    });
    tl.from('.hero-subtitle', { 
      y: 20, 
      opacity: 0, 
      duration: 0.8, 
      ease: 'power2.out' 
    }, '-=0.5');
    tl.from('.hero-button', { 
      y: 15, 
      opacity: 0, 
      duration: 0.7, 
      ease: 'back.out(1.2)' 
    }, '-=0.3');
  });
</script>

<main style="background-color: #1a1a1a;" class="text-gray-300 min-h-screen">
  <!-- Hero Section -->
 <section class="py-24 md:py-40 min-h-[90vh] flex items-center">
  <div class="container mx-auto px-4 text-center">
    <h1 class="hero-title text-5xl md:text-6xl font-bold mb-4">
      <span class="text-gray-400">Time</span><span style="color: #F00101;">Swift</span>
    </h1>
    <p class="hero-subtitle text-xl text-gray-500 mb-8">Optimiere deine Zeit. Maximiere deine Produktivität.</p>
    <button 
      class="hero-button hover:bg-gray-700 text-white py-3 px-8 rounded-md text-lg transition-colors border-2 border-transparent hover:border-[#F00101]"
      style="background-color: #373737;">
      Jetzt starten
    </button>
  </div>
</section>

<section class="py-16" style="background-color: #0a0a0a; position: relative; ">
  <AnimatedSplitText />
</section>

<section>
  <QuoteSection />
</section>

<section>
  <AnyPlatform />
</section>
<section>
  <BentoGrid />
</section>
  


  
 

  
           <!-- Alternative ohne fixed position -->
        <section class="w-full py-40 relative bg-black">
          <img 
            src="/home/red_bg.png" 
            alt="Produktivität" 
            class="absolute inset-0 w-full h-full object-cover object-center opacity-25"
          />
          
          <div class="container mx-auto px-4 text-center relative z-10">
            <h2 class="text-4xl font-bold text-white mb-4">Produktivität neu definiert</h2>
            <p class="text-xl text-gray-200 max-w-2xl mx-auto">
              TimeSwift passt sich deinem Arbeitsrhythmus an, nicht umgekehrt.
            </p>
          </div>
        </section>
  <!-- Call to Action Section -->
  <section class="py-20" style="background-color: #1a1a1a;">
    <div class="container mx-auto px-4 text-center">
      <h3 class="text-3xl font-bold mb-6 text-white">Bereit, <span style="color: #F00101;">Zeit zu sparen?</span></h3>
      <p class="text-xl text-gray-400 mb-8 max-w-2xl mx-auto">Starte noch heute mit TimeSwift und erlebe eine neue Dimension des Zeitmanagements.</p>
      <button style="background-color: #F00101;" class="hover:bg-red-700 text-white py-3 px-8 rounded-md text-lg transition-colors">
        Jetzt starten
      </button>
    </div>
  </section>
</main>

<footer style="background-color: #111111;" class="py-6 text-center text-gray-600">
  <div class="container mx-auto px-4">
    <p>&copy; 2025 <span style="color: #F00101;">TimeSwift</span></p>
  </div>
</footer>