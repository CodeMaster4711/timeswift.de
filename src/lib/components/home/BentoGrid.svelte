<script>
  import { onMount } from 'svelte';
  
  // Cursor-Tracking-Funktion
  let mouseX = 0;
  let mouseY = 0;
  let cursorElement;
  
  onMount(() => {
    const section = document.querySelector('.bento-section');
    
    if (section) {
      section.addEventListener('mousemove', (e) => {
        mouseX = e.clientX;
        mouseY = e.clientY;
        
        // Position des Cursors aktualisieren
        if (cursorElement) {
          const rect = section.getBoundingClientRect();
          cursorElement.style.left = `${mouseX - rect.left}px`;
          cursorElement.style.top = `${mouseY - rect.top}px`;
          cursorElement.style.opacity = '1';
        }
      });
      
      section.addEventListener('mouseleave', () => {
        if (cursorElement) {
          cursorElement.style.opacity = '0';
        }
      });
    }
  });
</script>

<svelte:head>
  <!-- Font Awesome von CDN einbinden -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</svelte:head>

<section class="bento-section relative">
    <div class="cursor-tracker" bind:this={cursorElement}></div>
    <div class="py-4 px-2 mx-auto max-w-screen-xl sm:py-4 lg:px-6 relative z-10">
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-5 gap-4 h-full">
            <div class="col-span-2 sm:col-span-1 md:col-span-2 h-auto md:h-full flex flex-col">
                <a href="" class="bento-card group relative flex flex-col overflow-hidden rounded-lg px-4 pb-4 pt-40 flex-grow">
                    <div class="flex flex-col items-center justify-center h-full w-full absolute inset-0">
                        <i class="fas fa-clock text-4xl mb-4" style="color: #F00101;"></i>
                        <h3 class="text-xl font-bold text-white mb-3">Präzise Zeiterfassung</h3>
                        <p class="text-sm text-gray-300 text-center px-4">
                            Erfassen Sie Arbeitszeiten in Echtzeit und erstellen Sie transparente Berichte.
                        </p>
                    </div>
                </a>
            </div>
            <div class="col-span-2 sm:col-span-1 md:col-span-2">
                <a href="" class="bento-card group relative flex flex-col overflow-hidden rounded-lg px-4 pb-4 pt-40 mb-4">
                    <div class="flex flex-col items-center justify-center h-full w-full absolute inset-0">
                        <i class="fas fa-users text-4xl mb-4" style="color: #F00101;"></i>
                        <h3 class="text-xl font-bold text-white mb-3">Zentrale Kundendatenbank</h3>
                        <p class="text-sm text-gray-300 text-left px-4">
                            Verwalten Sie Kontakte und wichtige Kundeninformationen strukturiert.
                        </p>
                    </div>
                </a>
                <div class="grid gap-4 grid-cols-2 sm:grid-cols-2 lg:grid-cols-2">
                    <a href="" class="bento-card group relative flex flex-col overflow-hidden rounded-lg px-4 pb-4 pt-40">
                        <div class="flex flex-col items-center justify-center h-full w-full absolute inset-0">
                            <i class="fas fa-tasks text-4xl mb-4" style="color: #F00101;"></i>
                            <h3 class="text-lg font-bold text-white mb-2">Projektmanagement</h3>
                            <p class="text-xs text-gray-300 text-left p-2 ">Planen Sie Projekte und überwachen Sie den Fortschritt.</p>
                        </div>
                    </a>
                    <a href="" class="bento-card group relative flex flex-col overflow-hidden rounded-lg px-4 pb-4 pt-40">
                        <div class="flex flex-col items-center justify-center h-full w-full absolute inset-0">
                            <i class="fas fa-file-alt text-4xl mb-4" style="color: #F00101;"></i>
                            <h3 class="text-lg font-bold text-white mb-2">Dokumentation</h3>
                            <p class="text-xs text-gray-300 text-left p-2">Organisieren Sie Dokumente zentral in der Cloud.</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-span-2 sm:col-span-1 md:col-span-1 h-auto md:h-full flex flex-col">
                <a href="" class="bento-card group relative flex flex-col overflow-hidden rounded-lg px-4 pb-4 pt-40 flex-grow">
                    <div class="flex flex-col items-center justify-center h-full w-full absolute inset-0">
                        <i class="fas fa-chart-line text-4xl mb-4" style="color: #F00101;"></i>
                        <h3 class="text-xl font-bold text-white mb-3">Effizienz</h3>
                        <p class="text-sm text-gray-300 text-left px-4 p-2">
                            Mit TimeSwift behalten Sie Deadlines und Budgets im Griff.
                        </p>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<style>
  .bento-section {
    position: relative;
    background-color: #1a1a1a; /* Deutlich dunkleres Grau */
  }
  
  /* Cursor-Tracker-Effekt */
  .cursor-tracker {
    position: absolute;
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background-color: #F00101; /* Das gewünschte Rot */
    box-shadow: 0 0 40px 20px rgba(240, 1, 1, 0.4);
    pointer-events: none;
    z-index: 5;
    transform: translate(-50%, -50%);
    opacity: 0;
    transition: opacity 0.3s ease;
  }
  
  /* Karten-Styling */
  .bento-card {
    background-color: rgba(45, 45, 45, 0.7); /* Dunkelgrau mit Transparenz */
    border: 1px solid rgba(60, 60, 60, 0.3); /* Subtile Umrandung */
    transition: all 0.4s ease;
    position: relative;
    overflow: hidden;
  }
  
  /* Hover-Effekt für Karten */
  .bento-card:hover {
    transform: translateY(-5px) scale(1.02);
    box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.4), 0 10px 10px -5px rgba(0, 0, 0, 0.3);
    border-color: #F00101; /* Rote Umrandung beim Hover */
    background-color: rgba(55, 55, 55, 0.8); /* Etwas helleres Grau beim Hover */
  }
  
  /* Icon-Animation beim Hover */
  .bento-card:hover i {
    transform: scale(1.2);
    text-shadow: 0 0 15px rgba(240, 1, 1, 0.6);
  }
  
  i {
    transition: all 0.3s ease;
  }
</style>