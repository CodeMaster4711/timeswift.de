
  <style>
  
    .container {
      text-align: center;
      color: white;
      position: relative;
      z-index: 1;
    }
  
    .logo {
      width: 150px;
      height: auto;
      margin-bottom: 20px;
    }
  
    .title {
      font-size: 3em;
      margin-bottom: 20px;
      background: linear-gradient(90deg, red, rgb(55, 55, 55));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
  
    .subtitle {
      font-size: 1.5em;
      margin-bottom: 40px;
    }
  
    .loader {
      width: 50px;
      height: 50px;
      border: 5px solid #292929;
      border-top: 5px solid red;
      border-radius: 50%;
      animation: spin 1s linear infinite;
      margin: 0 auto;
    }
  
    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
  
    .background {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      overflow: hidden;
      z-index: 0;
    }
  
    .star {
      position: absolute;
      width: 2px;
      height: 2px;
      background: white;
      border-radius: 50%;
      animation: twinkle 2s infinite ease-in-out;
    }
  
    .star.red {
      background: red;
    }
  
    @keyframes twinkle {
      0%, 100% {
        opacity: 0.5;
      }
      50% {
        opacity: 1;
      }
    }
  </style>
  
  <div class="background">
    {#each Array(100).fill() as _, i}
      <div class="star {Math.random() > 0.5 ? 'red' : ''}" style="top: {Math.random() * 100}%; left: {Math.random() * 100}%; animation-duration: {Math.random() * 2 + 1}s;"></div>
    {/each}
  </div>
  <div class="container">
    <img src="/128x128@2x.png" alt="Logo" class="logo" />
    <h1 class="title">TimeSwift</h1>
    <h2 class="subtitle">Work in Progress</h2>
    <div class="loader"></div>
  </div>