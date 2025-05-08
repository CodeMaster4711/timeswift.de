<script>
  import { onMount } from 'svelte';
  
  let features;
  let activeFeature = 0;
  
  const featureData = [
    {
      title: "Einfach",
      description: "Intuitive Oberfläche für effizientes Zeitmanagement. Starte sofort ohne komplizierte Einrichtung.",
      icon: `<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />`
    },
    {
      title: "Schnell",
      description: "Blitzschnelle Erfassung deiner Arbeitszeit ohne Verzögerung.",
      icon: `<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />`
    },
    {
      title: "Sicher",
      description: "Deine Daten bleiben geschützt und werden niemals ohne deine Erlaubnis geteilt.",
      icon: `<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />`
    },
    {
      title: "Auf allen Plattformen",
      description: "TimeSwift funktioniert nahtlos auf Desktop, Tablets und Smartphones.",
      icon: `<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />`
    },
    {
      title: "Automatisierung",
      description: "Wiederholende Aufgaben werden automatisch erfasst und kategorisiert.",
      icon: `<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />`
    }
  ];
  
  onMount(() => {
    // Referenzen zu allen Feature-Abschnitten holen
    const featureSections = document.querySelectorAll('.feature-row');
    
    const handleScroll = () => {
      if (!features) return;
      
      const scrollY = window.scrollY;
      const featuresTop = features.offsetTop;
      const featuresHeight = features.offsetHeight;
      
      // Prüfen, ob wir im Bereich der Features sind
      if (scrollY >= featuresTop - 300 && scrollY <= featuresTop + featuresHeight) {
        // Floating Icon-Block Position berechnen
        const scrollPosition = scrollY - featuresTop + 300;
        const iconBlock = document.querySelector('.floating-icon-block');
        
        if (iconBlock) {
          // Begrenzen der Position innerhalb der Features-Sektion
          const maxScroll = featuresHeight - 200; // 200px vom unteren Rand entfernt
          const limitedScroll = Math.min(scrollPosition, maxScroll);
          iconBlock.style.transform = `translateY(${limitedScroll}px)`;
          
          // Aktives Feature basierend auf Scroll-Position bestimmen
          featureSections.forEach((section, index) => {
            const sectionTop = section.offsetTop - featuresTop;
            const sectionBottom = sectionTop + section.offsetHeight;
            
            if (scrollPosition >= sectionTop - 100 && scrollPosition < sectionBottom) {
              activeFeature = index;
            }
          });
        }
      }
    };
    
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  });
</script>

<!-- Features Section -->
<section class="py-16 relative overflow-hidden" style="background-color: #373737;" bind:this={features}>
  <div class="container mx-auto px-4">
    <!-- Überschrift für den Features-Bereich -->
    <h2 class="text-3xl font-bold text-white text-center mb-16">Unsere Vorteile</h2>
    
    <!-- Floating Icon Block - Bleibt beim Scrollen fixiert -->
    <div class="floating-icon-block fixed left-4 md:left-1/4 transform -translate-x-1/2">
      <div class="w-24 h-24 md:w-32 md:h-32 rounded-full flex items-center justify-center shadow-xl" style="background-color: #F00101;">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-12 w-12 md:h-16 md:w-16 text-white transition-all" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          {@html featureData[activeFeature].icon}
        </svg>
      </div>
      <div class="h-full w-1 bg-gradient-to-b from-red-600 to-transparent absolute top-32 left-1/2 transform -translate-x-1/2"></div>
    </div>
    
    <!-- Feature Rows - Abwechselnd rechts und links -->
    <div class="ml-16 md:ml-32 space-y-32 relative">
      {#each featureData as feature, index}
        <div class="feature-row {index % 2 === 0 ? 'ml-16' : 'ml-32'} md:ml-64">
          <div class="p-6 rounded-lg shadow-lg transition-all" style="background-color: #222222;">
            <h3 class="text-2xl font-semibold text-white mb-3">{feature.title}</h3>
            <p class="text-gray-300">{feature.description}</p>
            <!-- Fortschrittsbalken -->
            <div class="mt-4 h-1 bg-gray-800 rounded-full overflow-hidden">
              <div class="progress-bar h-full bg-gray-600 rounded-full" style="animation-delay: {index * 0.3}s"></div>
            </div>
          </div>
        </div>
      {/each}
    </div>
  </div>
</section>

<style>
  @keyframes loadProgress {
    0% { width: 0%; background-color: #4b5563; }
    100% { width: 100%; background-color: #F00101; }
  }
  
  .progress-bar {
    animation: loadProgress 2.5s ease-out forwards;
  }
  
  .floating-icon-block {
    transition: transform 0.4s ease-out;
    position: absolute;
    top: 100px;
    z-index: 10;
  }
  
  .feature-row {
    position: relative;
    transition: all 0.3s ease;
    max-width: 500px;
  }
  
  /* Animation für Feature-Wechsel */
  .feature-row:not(:first-child) {
    animation: fadeIn 1s ease;
  }
  
  @keyframes fadeIn {
    from { opacity: 0.5; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }
</style>