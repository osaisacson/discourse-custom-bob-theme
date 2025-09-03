import Component from "@glimmer/component";
import { getOwner }from "@ember/application";
import { tracked } from "@glimmer/tracking";
import { service } from "@ember/service";
import DiscoveryTopicsList from "discourse/components/discovery-topics-list";
import SearchBanner from "discourse/components/search-banner";
import WhosOnline from "discourse/components/whos-online";

export default class CustomHomepage extends Component {
  <template>
    <div class="custom-homepage-wrapper">
      {{! Hero Section }}
      <section class="hero-section" style={{html-safe (concat "background-image: url(" (theme-prefix "assets/hero-image.jpg") ");")}}>
        <div class="hero-content">
          <h1>Välkommen till Sveriges idéburna byggrörelse</h1>
          <p>Här kan du se färdiga och planerade projekt, hitta kunskap och få kontakt med andra som bygger och bor ihop över hela landet.</p>
        </div>
        <div class="whos-online-container">
          <WhosOnline />
        </div>
      </section>

      {{! Search Section }}
      <section class="homepage-search-container">
        <SearchBanner @options={{hash placeholder="Sök bland allt"}} />
      </section>

      {{! Main Content Two-Column Layout }}
      <div class="main-content-grid">

        {{! Column 1: Left side cards }}
        <aside class="left-column">
          <a href="/c/gemenskaper/5/l/map?order=created" class="info-card" id="map-card">
            <img src={{theme-prefix "assets/map-card.jpg"}} alt="Karta över gemenskaper">
          </a>

          <a href="/tag/hitta-medlemmar" class="info-card">
            <img src={{theme-prefix "assets/projekt-card.jpg"}} alt="Projekt som söker boende">
            <div class="card-content">
              <h3>Projekt som söker boende</h3>
              <p>Är du intresserad av att gå med i en bygg- eller bogemenskap? Här ser du projekt som söker medlemmar.</p>
            </div>
          </a>

          <a href="/tag/hitta-mark" class="info-card">
            <img src={{theme-prefix "assets/mark-card.jpg"}} alt="Tillgänglig mark">
            <div class="card-content">
              <h3>Tillgänglig mark</h3>
              <p>Letar ni mark? Här hittar ni tips om vad som är tillgängligt.</p>
            </div>
          </a>

          <a href="/u?order=likes_received&period=all" class="info-card">
            <img src={{theme-prefix "assets/hitta-card.jpg"}} alt="Hitta varandra">
            <div class="card-content">
              <h3>Hitta varandra</h3>
              <p>Letar du efter någon? Här ser du alla som har registrerat sig på plattformen.</p>
            </div>
          </a>

          <a href="/invites/Bj4f1mYUD6" class="info-card">
            <img src={{theme-prefix "assets/go-med-card.jpeg"}} alt="Gå med i rörelsen">
            <div class="card-content">
              <h3>Gå med i rörelsen</h3>
              <p>Har du ingen profil ännu? Registrera dig här så kan du börja lägga upp poster och interagera med andra.</p>
            </div>
          </a>

          <a href="/docs?category=7" class="info-card">
            <img src={{theme-prefix "assets/biblioteket-card.jpg"}} alt="Upptäck biblioteket">
            <div class="card-content">
              <h3>Upptäck biblioteket</h3>
              <p>Filtrera på det du specifikt söker.</p>
            </div>
          </a>
        </aside>

        {{! Column 2: Right side latest feed }}
        <main class="right-column">
          <DiscoveryTopicsList />
        </main>

      </div>
    </div>
  </template>
}