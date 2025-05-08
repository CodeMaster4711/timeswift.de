<script>
  import BentoGrid from '$lib/components/home/BentoGrid.svelte';
  import Animated from '$lib/components/home/Animated.svelte';
</script>

<main style="background-color: #1a1a1a;" class="text-gray-300 min-h-screen">
  <!-- Hero Section -->
  <section class="py-20 md:py-32">
    <div class="container mx-auto px-4 text-center">
      <h1 class="text-5xl md:text-6xl font-bold mb-4">
        <span class="text-gray-400">Time</span><span style="color: #F00101;">Swift</span>
      </h1>
      <p class="text-xl text-gray-500 mb-8">Optimiere deine Zeit. Maximiere deine Produktivität.</p>
      <button style="background-color: #373737;" class="hover:bg-gray-700 text-white py-3 px-8 rounded-md text-lg transition-colors border-2 border-transparent hover:border-[#F00101]">
        Jetzt starten
      </button>
    </div>
  </section>

  <!-- Animation Section mit zusätzlicher Breite -->
  <section class="py-24" style="background-color: #0a0a0a;">
    <div class="container mx-auto px-4">
      <div class="flex justify-center items-center">
        <div class="text-center max-w-5xl w-full"> <!-- Breiter gemacht und volle Breite -->
          <div class="whitespace-nowrap overflow-x-hidden"> <!-- Verhindert Zeilenumbrüche -->
            <Animated />
          </div>
          <p class="text-gray-400 mt-8 text-xl">
            Optimiere deinen Workflow mit unserer intuitiven Zeiterfassung und steigere deine Produktivität nachhaltig.
          </p>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Features Section -->
  <section class="py-16" style="background-color: #373737;">
    <div class="container mx-auto px-4">
      <h3 class="text-3xl font-bold text-center mb-12 text-white">Unsere <span style="color: #F00101;">Vorteile</span></h3>
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
        <div class="text-center p-6 rounded-lg shadow-md hover:shadow-lg transition-all" style="background-color: #222222;">
          <div class="w-16 h-16 mx-auto mb-4 rounded-full flex items-center justify-center" style="background-color: #F00101;">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
            </svg>
          </div>
          <h2 class="text-2xl font-semibold mb-4 text-white">Einfach</h2>
          <p class="text-gray-300">Intuitive Oberfläche für effizientes Zeitmanagement</p>
        </div>
        <div class="text-center p-6 rounded-lg shadow-md hover:shadow-lg transition-all" style="background-color: #222222;">
          <div class="w-16 h-16 mx-auto mb-4 rounded-full flex items-center justify-center" style="background-color: #F00101;">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
          <h2 class="text-2xl font-semibold mb-4 text-white">Schnell</h2>
          <p class="text-gray-300">Blitzschnelle Erfassung deiner Arbeitszeit</p>
        </div>
        <div class="text-center p-6 rounded-lg shadow-md hover:shadow-lg transition-all" style="background-color: #222222;">
          <div class="w-16 h-16 mx-auto mb-4 rounded-full flex items-center justify-center" style="background-color: #F00101;">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
            </svg>
          </div>
          <h2 class="text-2xl font-semibold mb-4 text-white">Sicher</h2>
          <p class="text-gray-300">Deine Daten bleiben dort, wo sie hingehören</p>
        </div>
      </div>
    </div>
  </section>

  <!--Bento Grid Component -->
  <BentoGrid></BentoGrid>
  
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
        Kostenlos testen
      </button>
    </div>
  </section>
</main>

<footer style="background-color: #111111;" class="py-6 text-center text-gray-600">
  <div class="container mx-auto px-4">
    <p>&copy; 2025 <span style="color: #F00101;">TimeSwift</span></p>
  </div>
</footer>