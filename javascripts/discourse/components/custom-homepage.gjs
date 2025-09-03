import Component from "@glimmer/component";
import DiscoveryTopicsList from "discourse/components/discovery-topics-list";
import SearchBanner from "discourse/components/search-banner";
import WhosOnline from "discourse/components/whos-online";
import { htmlSafe } from "@ember/string";
import { concat, hash } from '@ember/helper'; // <-- FINAL FIX
import { service } from "@ember/service";

export default class CustomHomepage extends Component {
  @service site;

  // This is a robust way to get asset URLs without relying on the theme-prefix helper.
  get assetUrls() {
    const themeId = this.site.currentTheme.id;
    const settings = this.site.themeSettings;
    const getURL = (assetName) => settings[`${themeId}_${assetName}`];

    return {
      heroImage: getURL("hero-image"),
      mapCard: getURL("map-card"),
      projektCard: getURL("projekt-card"),
      markCard: getURL("mark-card"),
      hittaCard: getURL("hitta-card"),
      goMedCard: getURL("go-med-card"),
      biblioteketCard: getURL("biblioteket-card"),
    };
  }

  get heroStyle() {
    return htmlSafe(`background-image: url(${this.assetUrls.heroImage});`);
  }

  <template>
    <div class="custom-homepage-wrapper">
      {{! Hero Section }}
      <section class="hero-section" style={{this.heroStyle}}>
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
            <img src={{this.assetUrls.mapCard}} alt="Karta över gemenskaper">
          </a>
          
          <a href="/tag/hitta-medlemmar" class="info-card">
            <img src={{this.assetUrls.projektCard}} alt="Projekt som söker boende">
            <div class="card-content">
              <h3>Projekt som söker boende</h3>
            </div>
          </a>

          <a href="/tag/hitta-mark" class="info-card">
            <img src={{this.assetUrls.markCard}} alt="Tillgänglig mark">
            <div class="card-content">
              <h3>Tillgänglig mark</h3>
            </div>
          </a>

          <a href="/u?order=likes_received&period=all" class="info-card">
            <img src={{this.assetUrls.hittaCard}} alt="Hitta varandra">
            <div class="card-content">
              <h3>Hitta varandra</h3>
            </div>
          </a>

          <a href="/invites/Bj4f1mYUD6" class="info-card">
            <img src={{this.assetUrls.goMedCard}} alt="Gå med i rörelsen">
            <div class="card-content">
              <h3>Gå med i rörelsen</h3>
            </div>
          </a>

          <a href="/docs?category=7" class="info-card">
            <img src={{this.assetUrls.biblioteketCard}} alt="Upptäck biblioteket">
            <div class="card-content">
              <h3>Upptäck biblioteket</h3>
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