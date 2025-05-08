<script lang="ts">
    import '../app.css';
    import { onMount } from 'svelte';

    let { children } = $props();
    
    let scrollY = 0;
    let mobileMenuOpen = false;
    
    // Transparente Navbar beim Scrollen
    onMount(() => {
        const handleScroll = () => {
            scrollY = window.scrollY;
        };
        
        window.addEventListener('scroll', handleScroll);
        
        return () => {
            window.removeEventListener('scroll', handleScroll);
        };
    });
    
    const toggleMobileMenu = () => {
        mobileMenuOpen = !mobileMenuOpen;
    };
</script>

<header class={`fixed w-full z-50 transition-all duration-300 bg-black shadow-lg`}>
    <div class="container mx-auto px-4">
        <div class="flex items-center justify-between py-4">
            <!-- Logo -->
            <a href="/" class="flex items-center space-x-2">
                <div class="text-2xl font-bold">
                    <span class="text-gray-400">Time</span><span class="text-red-600">Swift</span>
                </div>
            </a>
            
            <!-- Desktop Navigation -->
            <nav class="hidden md:flex items-center space-x-8">
                <a href="/" class="text-gray-300 hover:text-red-500 transition-colors py-2 border-b-2 border-transparent hover:border-red-500">Startseite</a>
                <a href="/features" class="text-gray-300 hover:text-red-500 transition-colors py-2 border-b-2 border-transparent hover:border-red-500">Funktionen</a>
                <a href="/pricing" class="text-gray-300 hover:text-red-500 transition-colors py-2 border-b-2 border-transparent hover:border-red-500">Preise</a>
                <a href="/about" class="text-gray-300 hover:text-red-500 transition-colors py-2 border-b-2 border-transparent hover:border-red-500">Über uns</a>
                <button class="bg-red-600 hover:bg-red-700 text-white px-5 py-2 rounded-md transition-colors">
                    Login
                </button>
            </nav>
            
            <!-- Mobile Menu Button -->
            <button 
                class="md:hidden text-gray-300 focus:outline-none"
                on:click={toggleMobileMenu}
                aria-label="Menu"
            >
                {#if mobileMenuOpen}
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                {:else}
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
                    </svg>
                {/if}
            </button>
        </div>
    </div>
    
    <!-- Mobile Menu -->
    {#if mobileMenuOpen}
        <div class="md:hidden bg-gray-800 animate-fadeIn">
            <div class="container mx-auto px-4 py-4">
                <div class="flex flex-col space-y-4">
                    <a href="/" class="text-gray-300 hover:text-red-500 transition-colors py-3 px-2 border-l-4 border-transparent hover:border-red-500">Startseite</a>
                    <a href="/features" class="text-gray-300 hover:text-red-500 transition-colors py-3 px-2 border-l-4 border-transparent hover:border-red-500">Funktionen</a>
                    <a href="/pricing" class="text-gray-300 hover:text-red-500 transition-colors py-3 px-2 border-l-4 border-transparent hover:border-red-500">Preise</a>
                    <a href="/about" class="text-gray-300 hover:text-red-500 transition-colors py-3 px-2 border-l-4 border-transparent hover:border-red-500">Über uns</a>
                    <button class="bg-red-600 hover:bg-red-700 text-white py-3 rounded-md transition-colors">
                        Login
                    </button>
                </div>
            </div>
        </div>
    {/if}
</header>

<main class="pt-16">
    {@render children()}
</main>

<style>
    /* Animation für das mobile Menü */
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    
    .animate-fadeIn {
        animation: fadeIn 0.3s ease-out forwards;
    }
</style>