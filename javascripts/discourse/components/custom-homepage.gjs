import Component from "@glimmer/component";
import DiscoveryTopicsList from "discourse/components/discovery-topics-list";
import WhosOnline from "discourse/plugins/discourse-whos-online/discourse/components/whos-online";
import SearchMenu from "discourse/components/search-menu";
import { themeAsset } from "discourse-common/lib/helpers";


export default class CustomHomepage extends Component {
<template>
  <div class="custom-homepage-wrapper">

    <section class="hero-section">
      <div class="hero-content">
        <h1>Välkommen till Sveriges idéburna byggrörelse</h1>
        <p>
          Här kan du se färdiga och planerade projekt, hitta kunskap och få
          kontakt med andra som bygger och bor ihop över hela landet.
        </p>
      </div>

      <div class="whos-online-container">
        <WhosOnline />
      </div>
    </section>

    <section class="homepage-search-container">
      <SearchMenu />
    </section>

    <div class="main-content-grid">
      <aside class="left-column">

        <a href="/c/gemenskaper/5/l/map?order=created" class="info-card" id="map-card">
          <img src={{theme-asset "map-card"}} alt="Karta" />
        </a>

        <a href="/tag/hitta-medlemmar" class="info-card">
          <img src={{theme-asset "projekt-card"}} alt="Projekt som söker boende" />
          <div class="card-content">
            <h3>Projekt som söker boende</h3>
          </div>
        </a>

        <a href="/tag/hitta-mark" class="info-card">
          <img src={{theme-asset "mark-card"}} alt="Tillgänglig mark" />
          <div class="card-content">
            <h3>Tillgänglig mark</h3>
          </div>
        </a>

        <a href="/u?order=likes_received&period=all" class="info-card">
          <img src={{theme-asset "hitta-card"}} alt="Hitta varandra" />
          <div class="card-content">
            <h3>Hitta varandra</h3>
          </div>
        </a>

        <a href="/invites/Bj4f1mYUD6" class="info-card">
          <img src={{theme-asset "go-med-card"}} alt="Gå med i rörelsen" />
          <div class="card-content">
            <h3>Gå med i rörelsen</h3>
          </div>
        </a>

        <a href="/docs?category=7" class="info-card">
          <img src={{theme-asset "biblioteket-card"}} alt="Upptäck biblioteket" />
          <div class="card-content">
            <h3>Upptäck biblioteket</h3>
          </div>
        </a>

      </aside>

      <main class="right-column">
        <DiscoveryTopicsList />
      </main>
    </div>
  </div>
</template>
}
