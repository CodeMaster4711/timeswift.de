<script>
  import { onMount } from 'svelte';
  import gsap from 'gsap';
  import { ScrollTrigger } from 'gsap/ScrollTrigger';
  
  $effect(() => {
    gsap.registerPlugin(ScrollTrigger);
    
    const bentoCards = gsap.utils.toArray('.bento-card');
    const bentoSection = document.querySelector('.bento-section');
    const cursorElement = document.querySelector('.cursor-glow');
    
    // Initiale Animation der Karten
    gsap.set(bentoCards, { 
      y: 40, 
      opacity: 0,
      scale: 0.97
    });
    
    // Staggered Einblende-Animation
    ScrollTrigger.batch(bentoCards, {
      start: "top bottom-=150px",
      onEnter: batch => {
        gsap.to(batch, {
          opacity: 1,
          y: 0,
          scale: 1,
          stagger: { 
            each: 0.1,
            grid: "auto",
            from: "center" 
          },
          duration: 0.8,
          ease: "power3.out"
        });
      },
      once: true
    });
    
    // Titel-Animation
    gsap.from('.bento-title-wrapper', {
      opacity: 0,
      y: 30,
      duration: 0.8,
      scrollTrigger: {
        trigger: '.bento-section',
        start: "top bottom-=100px",
        once: true
      }
    });
    
    // Icons mit einem "Pop"-Effekt
    gsap.fromTo('.bento-card .icon-wrapper', 
      { scale: 0, opacity: 0 },
      { 
        scale: 1, 
        opacity: 1,
        duration: 0.5,
        stagger: 0.07,
        delay: 0.4,
        ease: "back.out(1.7)",
        scrollTrigger: {
          trigger: '.bento-section',
          start: "top bottom-=100px",
          once: true
        }
      }
    );
    
    // Hover-Animationen für die Karten
    bentoCards.forEach(card => {
      const iconWrapper = card.querySelector('.icon-wrapper');
      const title = card.querySelector('h3');
      const content = card.querySelector('p');
      
      card.addEventListener('mouseenter', () => {
        // Karten-Animation
        gsap.to(card, {
          backgroundColor: 'rgba(30, 30, 30, 0.95)',
          boxShadow: '0 20px 25px -5px rgba(0, 0, 0, 0.4), 0 0 0 1px #F00101',
          scale: 1.02,
          y: -5,
          duration: 0.4,
          ease: 'power2.out'
        });
        
        // Icon-Animation
        gsap.to(iconWrapper, {
          scale: 1.1,
          backgroundColor: 'rgba(240, 1, 1, 0.15)',
          duration: 0.4,
          ease: 'back.out(1.7)'
        });
        
        // Text-Animation
        gsap.to([title, content], {
          y: -3,
          color: '#ffffff',
          duration: 0.3,
          stagger: 0.05,
          ease: 'power2.out'
        });
        
        // Glow-Effekt
        if (cursorElement) {
          gsap.to(cursorElement, {
            scale: 2.5,
            opacity: 0.6,
            duration: 0.3
          });
        }
      });
      
      card.addEventListener('mouseleave', () => {
        // Reset-Animation
        gsap.to(card, {
          backgroundColor: 'rgba(25, 25, 25, 0.6)',
          boxShadow: '0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 0 0 1px rgba(60, 60, 60, 0.1)',
          scale: 1,
          y: 0,
          duration: 0.5,
          ease: 'power3.out'
        });
        
        gsap.to(iconWrapper, {
          scale: 1,
          backgroundColor: 'rgba(240, 1, 1, 0.08)',
          duration: 0.3,
          ease: 'power2.out'
        });
        
        gsap.to([title], {
          y: 0,
          color: '#f0f0f0',
          duration: 0.3,
          ease: 'power2.out'
        });
        
        gsap.to([content], {
          y: 0,
          color: '#a0a0a0',
          duration: 0.3,
          ease: 'power2.out'
        });
        
        // Glow zurücksetzen
        if (cursorElement) {
          gsap.to(cursorElement, {
            scale: 1,
            opacity: 0.2,
            duration: 0.5
          });
        }
      });
    });
    
    // Cursor-Effekt
    if (bentoSection && cursorElement) {
      let xTo = gsap.quickTo(cursorElement, "left", {duration: 0.6, ease: "power3.out"}),
          yTo = gsap.quickTo(cursorElement, "top", {duration: 0.6, ease: "power3.out"});
      
      bentoSection.addEventListener('mousemove', (e) => {
        const rect = bentoSection.getBoundingClientRect();
        xTo(e.clientX - rect.left);
        yTo(e.clientY - rect.top);
        
        // Cursor einblenden
        gsap.to(cursorElement, {
          opacity: 0.2,
          duration: 0.3,
          ease: "power2.out"
        });
      });
      
      bentoSection.addEventListener('mouseleave', () => {
        gsap.to(cursorElement, {
          opacity: 0,
          duration: 0.5
        });
      });
    }
    
    // Subtile Hintergrund-Animation
    gsap.to('.bento-bg-gradient', {
      backgroundPosition: '100% 100%',
      duration: 15,
      repeat: -1,
      yoyo: true,
      ease: "sine.inOut"
    });
  });
</script>

<section class="bento-section relative py-16 md:py-24 overflow-hidden bg-[#141414]">
  <!-- Hintergrund-Elemente -->
  <div class="bento-bg-gradient absolute inset-0 opacity-40"></div>
  <div class="absolute top-0 left-0 w-full h-40 bg-gradient-to-b from-black to-transparent opacity-40"></div>
  <div class="cursor-glow"></div>
  
  <div class="container mx-auto px-4 relative z-10">
    <!-- Überschrift mit Dekoration -->
    <div class="bento-title-wrapper mb-16 text-center relative">
      <div class="w-12 h-1 bg-[#F00101] mx-auto mb-4"></div>
      <h2 class="text-4xl md:text-5xl font-bold text-white">Funktionen</h2>
      <p class="mt-4 text-gray-400 max-w-xl mx-auto">Entdecken Sie die leistungsstarken Features von TimeSwift</p>
    </div>
    
    <!-- Bento Grid Layout -->
    <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-5 gap-5 md:gap-6">
      <!-- Große Karte: Zeiterfassung -->
      <div class="md:col-span-2 lg:col-span-2 h-auto md:h-full">
        <a href="" class="bento-card group relative flex flex-col rounded-2xl p-8 h-full backdrop-blur-sm">
          <div class="icon-wrapper flex items-center justify-center w-16 h-16 rounded-xl mb-6 bg-opacity-10 bg-[#F00101]/5">
            <i class="fas fa-clock text-[#F00101] text-2xl"></i>
          </div>
          <h3 class="text-xl font-bold text-[#f0f0f0] mb-3">Präzise Zeiterfassung</h3>
          <p class="text-[#a0a0a0] leading-relaxed">
            Erfassen Sie Arbeitszeiten in Echtzeit und erstellen Sie transparente Berichte für Ihre Projekte und Kunden.
          </p>
        </a>
      </div>
      
      <!-- Große Karte: Kundendatenbank -->
      <div class="md:col-span-2">
        <a href="" class="bento-card group relative flex flex-col rounded-2xl p-8 backdrop-blur-sm mb-6">
          <div class="icon-wrapper flex items-center justify-center w-16 h-16 rounded-xl mb-6 bg-opacity-10 bg-[#F00101]/5">
            <i class="fas fa-users text-[#F00101] text-2xl"></i>
          </div>
          <h3 class="text-xl font-bold text-[#f0f0f0] mb-3">Zentrale Kundendatenbank</h3>
          <p class="text-[#a0a0a0] leading-relaxed">
            Verwalten Sie Kontakte und wichtige Kundeninformationen strukturiert und effizient.
          </p>
        </a>
        
        <!-- Kleine Karten in einem Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
          <!-- Projektmanagement -->
          <a href="" class="bento-card group relative flex flex-col rounded-2xl p-8 backdrop-blur-sm">
            <div class="icon-wrapper flex items-center justify-center w-14 h-14 rounded-xl mb-5 bg-opacity-10 bg-[#F00101]/5">
              <i class="fas fa-tasks text-[#F00101] text-xl"></i>
            </div>
            <h3 class="text-lg font-bold text-[#f0f0f0] mb-2">Projektmanagement</h3>
            <p class="text-sm text-[#a0a0a0] leading-relaxed">Planen Sie Projekte und überwachen Sie den Fortschritt.</p>
          </a>
          
          <!-- Dokumentation -->
          <a href="" class="bento-card group relative flex flex-col rounded-2xl p-8 backdrop-blur-sm">
            <div class="icon-wrapper flex items-center justify-center w-14 h-14 rounded-xl mb-5 bg-opacity-10 bg-[#F00101]/5">
              <i class="fas fa-file-alt text-[#F00101] text-xl"></i>
            </div>
            <h3 class="text-lg font-bold text-[#f0f0f0] mb-2">Dokumentation</h3>
            <p class="text-sm text-[#a0a0a0] leading-relaxed">Organisieren Sie Dokumente zentral in der Cloud.</p>
          </a>
        </div>
      </div>
      
      <!-- Große Karte: Effizienz -->
      <div class="md:col-span-1 h-auto md:h-full">
        <a href="" class="bento-card group relative flex flex-col rounded-2xl p-8 h-full backdrop-blur-sm">
          <div class="icon-wrapper flex items-center justify-center w-16 h-16 rounded-xl mb-6 bg-opacity-10 bg-[#F00101]/5">
            <i class="fas fa-chart-line text-[#F00101] text-2xl"></i>
          </div>
          <h3 class="text-xl font-bold text-[#f0f0f0] mb-3">Effizienz</h3>
          <p class="text-[#a0a0a0] leading-relaxed">
            Mit TimeSwift behalten Sie Deadlines und Budgets im Griff, optimieren Ihre Prozesse und steigern die Produktivität.
          </p>
        </a>
      </div>
    </div>
  </div>
</section>

<style>
  /* Hintergrundeffekte */
  .bento-bg-gradient {
    background: radial-gradient(circle at 10% 10%, 
      rgba(30, 30, 30, 0.3),
      rgba(15, 15, 15, 0.4),
      rgba(10, 10, 10, 0.7)
    ), linear-gradient(45deg, 
      rgba(240, 1, 1, 0.05),
      transparent 70%,
      rgba(30, 30, 30, 0.1)
    );
    background-size: 200% 200%;
    filter: contrast(1.1);
  }
  
  /* Karten-Styling */
  .bento-card {
    background-color: rgba(25, 25, 25, 0.6);
    border: 1px solid rgba(60, 60, 60, 0.1);
    box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
    transition: all 0.4s ease;
    height: 100%;
  }
  
  /* Glaseffekt */
  .backdrop-blur-sm {
    backdrop-filter: blur(12px);
  }
  
  /* Cursor-Glow Effekt */
  .cursor-glow {
    position: absolute;
    width: 150px;
    height: 150px;
    border-radius: 50%;
    background: radial-gradient(circle, rgba(240, 1, 1, 0.3) 0%, rgba(240, 1, 1, 0) 70%);
    pointer-events: none;
    z-index: 1;
    transform: translate(-50%, -50%);
    opacity: 0;
  }
  
  /* Icon-Container */
  .icon-wrapper {
    background-color: rgba(240, 1, 1, 0.08);
    transition: all 0.3s ease;
  }
  
  /* Responsive Anpassungen */
  @media (max-width: 768px) {
    .bento-card {
      padding: 1.5rem;
    }
    
    .icon-wrapper {
      width: 3rem;
      height: 3rem;
      margin-bottom: 1rem;
    }
  }

  .bento-section {
    height: 110vh;
  }
</style>