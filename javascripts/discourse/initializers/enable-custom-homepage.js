import { apiInitializer } from "discourse/lib/api";
import Component from "@ember/component";
import { hbs } from "ember-cli-htmlbars";
import { inject as service } from "@ember/service";
import { computed } from "@ember/object";

export default apiInitializer("0.8", (api) => {
  api.registerConnectorClass("custom-homepage", "byggboihop-homepage", {
    // This is the Ember Component definition
    Component,
    
    // This is the Handlebars template for the component
    template: hbs`
      <div class="custom-homepage-wrapper">
        {{! Hero Section }}
        <section class="hero-section" style={{this.heroStyle}}>
          <div class="hero-content">
            <h1>Välkommen till Sveriges idéburna byggrörelse</h1>
            <p>Här kan du se färdiga och planerade projekt, hitta kunskap och få kontakt med andra som bygger och bor ihop över hela landet.</p>
          </div>
          <div class="whos-online-container">
            {{mount-widget widget="whos-online"}}
          </div>
        </section>
  
        {{! Search Section }}
        <section class="homepage-search-container">
          {{search-banner placeholder="Sök bland allt"}}
        </section>
  
        {{! Main Content Two-Column Layout }}
        <div class="main-content-grid">
          
          {{! Column 1: Left side cards }}
          <aside class="left-column">
            <a href="/c/gemenskaper/5/l/map?order=created" class="info-card" id="map-card">
              <img src={{this.themeSettings.map_card}} alt="Karta över gemenskaper">
            </a>
            
            <a href="/tag/hitta-medlemmar" class="info-card">
              <img src={{this.themeSettings.projekt_card}} alt="Projekt som söker boende">
              <div class="card-content">
                <h3>Projekt som söker boende</h3>
              </div>
            </a>
  
            <a href="/tag/hitta-mark" class="info-card">
              <img src={{this.themeSettings.mark_card}} alt="Tillgänglig mark">
              <div class="card-content">
                <h3>Tillgänglig mark</h3>
              </div>
            </a>
  
            <a href="/u?order=likes_received&period=all" class="info-card">
              <img src={{this.themeSettings.hitta_card}} alt="Hitta varandra">
              <div class="card-content">
                <h3>Hitta varandra</h3>
              </div>
            </a>
  
            <a href="/invites/Bj4f1mYUD6" class="info-card">
              <img src={{this.themeSettings.go_med_card}} alt="Gå med i rörelsen">
              <div class="card-content">
                <h3>Gå med i rörelsen</h3>
              </div>
            </a>
  
            <a href="/docs?category=7" class="info-card">
              <img src={{this.themeSettings.biblioteket_card}} alt="Upptäck biblioteket">
              <div class="card-content">
                <h3>Upptäck biblioteket</h3>
              </div>
            </a>
          </aside>
  
          {{! Column 2: Right side latest feed }}
          <main class="right-column">
            {{discovery-topics-list}}
          </main>
          
        </div>
      </div>
    `,

    // This part handles the logic for getting image URLs
    siteSettings: service(),

    themeSettings: computed(function () {
      const themeId = this.site.currentTheme.id;
      const themeSettings = this.site.themeSettings;
      
      // Manually construct the URL for each asset
      const getURL = (assetName) => {
        const key = `${themeId}_${assetName}`;
        return themeSettings[key];
      };

      return {
        hero_image: getURL("hero-image"),
        map_card: getURL("map-card"),
        projekt_card: getURL("projekt-card"),
        mark_card: getURL("mark-card"),
        hitta_card: getURL("hitta-card"),
        go_med_card: getURL("go-med-card"),
        biblioteket_card: getURL("biblioteket-card"),
      };
    }),

    heroStyle: computed('themeSettings.hero_image', function() {
      const url = this.themeSettings.hero_image;
      return `background-image: url(${url});`.htmlSafe();
    }),
  });
});