<script>
  import { onMount, onDestroy } from 'svelte';
  
  // Wörter, die animiert werden sollen
  const words = [
    'effizienter',
    'produktiver',
    'einfacher',
    'besser',
    'übersichtlicher',
    'smarter'
  ];
  
  let currentIndex = 0;
  let visible = true;
  let interval;
  
  function animateWords() {
    // Erst ausblenden
    visible = false;
    
    // Nach kurzer Verzögerung Wort wechseln und wieder einblenden
    setTimeout(() => {
      currentIndex = (currentIndex + 1) % words.length;
      visible = true;
    }, 1000); // Ausblendzeit
  }
  
  onMount(() => {
    // Animation starten
    interval = setInterval(animateWords, 6000); // Gesamtzeit pro Wort
  });
  
  onDestroy(() => {
    // Timer aufräumen, wenn Komponente entfernt wird
    clearInterval(interval);
  });
</script>

<div class="animated-text">
    <span class="text-white">TimeSwift macht dein Zeitmanagement</span>
    <span class="text-white">&nbsp;</span>
    <span class="changing-word" class:visible>
      <span style="color: #F00101;">{words[currentIndex]}</span>
    </span>
  </div>

<style>
  .animated-text {
    display: inline-flex;
    align-items: center;
    font-size: 2.5rem;
    font-weight: bold;
    line-height: 1.2;
    flex-wrap: wrap;
  }
  
  .changing-word {
    position: relative;
    opacity: 0;
    transform: translateY(10px);
    transition: opacity 0.5s ease, transform 0.5s ease;
  }
  
  .changing-word.visible {
    opacity: 1;
    transform: translateY(0);
  }
</style>