<script>
  import { onMount } from 'svelte';
  import gsap from 'gsap';

  let deviceState = "desktop"; // State zum Tracking der aktuellen Gerätegröße

  onMount(() => {
    gsap.registerPlugin();

    // Animation für den Titel
    gsap.from('.title-word', {
      opacity: 0,
      y: 30,
      duration: 1,
      stagger: 0.3,
      ease: 'power2.out'
    });

    // Animation für den Untertitel
    gsap.from('.platform-subtitle', {
      opacity: 0,
      y: 20,
      duration: 1,
      delay: 0.5,
      ease: 'power2.out'
    });
    
    // Animation für den Gradienten-Kreis
    gsap.to('.gradient-circle', {
      rotation: 360,
      duration: 20,
      ease: 'none',
      repeat: -1
    });

    // Pulsieren des Kreises
    gsap.to('.gradient-circle', {
      scale: 1.1,
      opacity: 0.9,
      duration: 2.5,
      yoyo: true,
      repeat: -1,
      ease: 'sine.inOut'
    });

    // Größenänderung des Displays in einer Endlosschleife
    const sizeTl = gsap.timeline({
      repeat: -1,
      repeatDelay: 0.5,
      onUpdate: function() {
        // Aktuellen State basierend auf der Timeline-Position setzen
        const progress = sizeTl.progress();
        if (progress < 0.33) {
          deviceState = "desktop";
        } else if (progress < 0.67) {
          deviceState = "tablet";
        } else {
          deviceState = "phone";
        }
      }
    });

    // Desktop-Größe (Standard)
    sizeTl.to('.device-display', {
      width: '70%',
      height: '60%',
      borderRadius: '12px',
      duration: 2,
      ease: 'power2.inOut'
    })
    // Tablet-Größe
    .to('.device-display', {
      width: '45%',
      height: '65%',
      borderRadius: '16px',
      duration: 2,
      ease: 'power2.inOut',
      delay: 1.5
    })
    // Smartphone-Größe - jetzt deutlich höher
    .to('.device-display', {
      width: '25%',
      height: '85%', // Deutlich höher als zuvor
      borderRadius: '24px',
      duration: 2,
      ease: 'power2.inOut',
      delay: 1.5
    });
  });
</script>

<section class="relative py-24 px-4 flex flex-col items-center overflow-hidden bg-[#0f0f0f] min-h-screen">
  <div class="flex justify-between items-center w-full max-w-7xl mx-auto">
    <div class="flex-1 flex justify-center items-center h-[60vh] relative">
      <div class="device-display bg-[#fdf4ff] shadow-2xl flex justify-center items-center relative overflow-hidden">
        <div class="gradient-circle"></div>
      </div>
    </div>
    
    <div class="text-left hidden md:block">
      <h2 class="text-5xl md:text-6xl  font-bold text-gray-100 whitespace-nowrap z-10 title-word">
        <span class="title-word">Jede</span> <span class="title-word">Plattrom</span><br>
        <span class="title-word">Zu</span> <span class="title-word">jedem</span> <span class="title-word">Zeitpunkt</span><br>
        <span class="title-word">An</span> <span class="title-word">jedem</span> <span class="title-word">Ort</span><br>
      </h2>
       <p class="text-gray-400 text-xl mt-12 max-w-md text-center platform-subtitle">
         Auf allen Geräten verfügbar. Egal ob Desktop, Tablet oder Smartphone.
        </p>
    </div>
  </div>
  
  <!-- Mobile Anzeige der Titel -->
  <div class="md:hidden text-center mb-8">
    <h2 class="text-5xl font-bold text-gray-100">
      <span class="title-word">Any</span> <span class="title-word">Size</span>
    </h2>
  </div>
</section>

<style>
  .device-display {
    width: 70%;
    height: 60%;
    border-radius: 12px;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
    transition: border-radius 0.5s ease;
  }
  
  .gradient-circle {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    background: linear-gradient(135deg, #f0a1ff 0%, #3bd9ff 100%);
    filter: blur(5px);
    opacity: 0.8;
  }
  
  /* Responsive styles für kleinere Geräte */
  @media (max-width: 768px) {
    .gradient-circle {
      width: 100px;
      height: 100px;
    }
    
    .device-display {
      width: 80%;
      height: 70%;
    }
  }
</style>