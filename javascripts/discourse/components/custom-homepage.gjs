import Component from "@glimmer/component";

export default class CustomHomepage extends Component {

  <template>
<div class="custom-homepage-wrapper">

  <section class="hero-section" style="background-image: url({{@theme.cdn_url}}/assets/hero-image.jpg)">
    <div class="hero-content">
      <h1>Välkommen till Sveriges idéburna byggrörelse</h1>
      <p>Här kan du se färdiga och planerade projekt, hitta kunskap och få kontakt med andra som bygger och bor ihop över hela landet.</p>
    </div>
    <div class="whos-online-container">
      {{whos-online}}
    </div>
  </section>

  <section class="homepage-search-container">
    {{search-banner placeholder="Sök bland allt"}}
  </section>

  <div class="main-content-grid">
    
    <aside class="left-column">
      <a href="/c/gemenskaper/5/l/map?order=created" class="info-card" id="map-card">
        <img src="{{@theme.cdn_url}}/assets/map-card.jpg" alt="Karta över gemenskaper">
      </a>
      
      <a href="/tag/hitta-medlemmar" class="info-card">
        <img src="{{@theme.cdn_url}}/assets/projekt-card.jpg" alt="Projekt som söker boende">
        <div class="card-content">
          <h3>Projekt som söker boende</h3>
        </div>
      </a>

      <a href="/tag/hitta-mark" class="info-card">
        <img src="{{@theme.cdn_url}}/assets/mark-card.jpg" alt="Tillgänglig mark">
        <div class="card-content">
          <h3>Tillgänglig mark</h3>
        </div>
      </a>

      <a href="/u?order=likes_received&period=all" class="info-card">
        <img src="{{@theme.cdn_url}}/assets/hitta-card.jpg" alt="Hitta varandra">
        <div class="card-content">
          <h3>Hitta varandra</h3>
        </div>
      </a>

      <a href="/invites/Bj4f1mYUD6" class="info-card">
        <img src="{{@theme.cdn_url}}/assets/go-med-card.jpeg" alt="Gå med i rörelsen">
        <div class="card-content">
          <h3>Gå med i rörelsen</h3>
        </div>
      </a>

      <a href="/docs?category=7" class="info-card">
        <img src="{{@theme.cdn_url}}/assets/biblioteket-card.jpg" alt="Upptäck biblioteket">
        <div class="card-content">
          <h3>Upptäck biblioteket</h3>
        </div>
      </a>
    </aside>

    <main class="right-column">
      {{discovery-topics-list}}
    </main>
    
  </div>
</div>
  </template>
}
