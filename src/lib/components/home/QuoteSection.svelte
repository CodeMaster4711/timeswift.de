<script>
  import { onMount } from 'svelte';
  import gsap from 'gsap';
  
  // Array mit Zitaten und Autoren
  const quotes = [
    {
      text: "GSAP ist das beste Tool für TimeSwift Animationen seit es Zeitmanagement gibt.",
      author: "TimeSwift Team",
      role: "Entwickler"
    },
    {
      text: "Die Kunst ist nicht, keine Zeit zu verlieren, sondern sie bewusst zu investieren.",
      author: "Sebastian Müller",
      role: "Produktivitätsexperte"
    },
    {
      text: "Produktivität ist niemals ein Zufall. Es ist immer das Ergebnis intelligenter Planung.",
      author: "Paul J. Meyer",
      role: "Autor"
    },
    {
      text: "Erfolgreiche Menschen fokussieren nicht auf die Zeit, sondern auf die Ergebnisse.",
      author: "Anna Schmidt",
      role: "TimeSwift-Nutzerin"
    }
  ];
  
  // Index des aktuell angezeigten Zitats
  let currentIndex = 0;
  
  // Funktion zum Wechseln des Zitats
  function changeQuote(direction) {
    // Aktuelle Elemente ausblenden
    const elements = gsap.utils.toArray('.animate-quote');
    
    gsap.timeline()
      .to(elements, { 
        opacity: 0, 
        y: direction > 0 ? -30 : 30, 
        duration: 0.5,
        ease: "power3.out",
        stagger: 0.05,
        onComplete: () => {
          // Index aktualisieren
          currentIndex = (currentIndex + direction + quotes.length) % quotes.length;
          
          // Elemente wieder einblenden
          gsap.to(elements, {
            opacity: 1,
            y: 0,
            duration: 0.7,
            stagger: 0.1,
            ease: "power2.out"
          });
        }
      });
  }

  // Initial Animation beim Laden
  onMount(() => {
    const elements = gsap.utils.toArray('.animate-quote');
    gsap.set(elements, { opacity: 0, y: 30 });
    
    gsap.timeline()
      .to(elements, {
        opacity: 1,
        y: 0,
        duration: 1,
        stagger: 0.1,
        ease: "power3.out"
      })
      .from('.quote-nav', {
        opacity: 0,
        y: 20,
        duration: 0.7,
        ease: "power2.out"
      }, "-=0.5");
  });
</script>

<section class="quote-section">
  <div class="quote-container">
    <div class="quote-content">
      <h2 class="quote-text animate-quote">{quotes[currentIndex].text}</h2>
      
      <div class="quote-author-container animate-quote">
        <div class="author-info">
          <p class="author-name">{quotes[currentIndex].author}</p>
          <p class="author-role">{quotes[currentIndex].role}</p>
        </div>
      </div>
    </div>
    
    <div class="quote-nav">
      <div class="indicators">
        {#each quotes as _, index}
          <button 
            class="indicator-dot" 
            class:active={index === currentIndex} 
            on:click={() => {
              if (index > currentIndex) changeQuote(index - currentIndex);
              else if (index < currentIndex) changeQuote(-(currentIndex - index));
            }}
            aria-label={`Zitat ${index + 1}`}
          ></button>
        {/each}
      </div>
      
      <div class="nav-buttons">
        <button class="nav-button prev" on:click={() => changeQuote(-1)} aria-label="Vorheriges Zitat">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
            <path d="M15 18L9 12L15 6" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </button>
        
        <button class="nav-button next" on:click={() => changeQuote(1)} aria-label="Nächstes Zitat">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5">
            <path d="M9 18L15 12L9 6" stroke-linecap="round" stroke-linejoin="round"/>
          </svg>
        </button>
      </div>
    </div>
  </div>
</section>

<style>
  .quote-section {
    width: 100%;
    padding: 8rem 2rem;
    background: #0f0f0f;
    color: #ffffff;
    min-height: 60vh;
    display: flex;
    align-items: center;
  }
  
  .quote-container {
    max-width: 1200px;
    width: 100%;
    margin: 0 auto;
    position: relative;
  }
  
  .quote-content {
    margin-bottom: 5rem;
  }
  
  .quote-text {
    font-size: 3.5rem;
    line-height: 1.2;
    font-weight: 600;
    margin-bottom: 3rem;
    letter-spacing: -0.02em;
  }
  
  .quote-author-container {
    display: flex;
    align-items: center;
  }
  
  .author-info {
    display: flex;
    flex-direction: column;
  }
  
  .author-name {
    font-size: 1.1rem;
    font-weight: 500;
    color: #f00101;
  }
  
  .author-role {
    font-size: 0.9rem;
    color: #999;
    margin-top: 0.2rem;
  }
  
  .quote-nav {
    width: 100%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
  }
  
  .indicators {
    display: flex;
    gap: 0.5rem;
  }
  
  .indicator-dot {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    background: white;
    border: none;
    padding: 0;
    cursor: pointer;
    transition: all 0.3s ease;
  }
  
  .indicator-dot.active {
    background: #f00101;
    transform: scale(1.2);
  }
  
  .nav-buttons {
    display: flex;
    gap: 1rem;
  }
  
  .nav-button {
    width: 48px;
    height: 48px;
    border: 1px solid rgba(255, 255, 255, 0.2);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    background: transparent;
    color: white;
    cursor: pointer;
    transition: all 0.3s ease;
  }
  
  .nav-button:hover {
    background: rgba(255, 255, 255, 0.1);
    border-color: #f00101;
    color: #f00101;
  }
  
  @media (max-width: 768px) {
    .quote-text {
      font-size: 2.2rem;
    }
    
    .quote-section {
      padding: 5rem 1.5rem;
    }
    
    .nav-button {
      width: 40px;
      height: 40px;
    }
  }
</style>