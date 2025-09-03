import { withPluginApi } from "discourse/lib/plugin-api";
import { getOwner } from "discourse-common/lib/get-owner";

export default {
  name: "category-filters-initializer",

  initialize() {
    withPluginApi("0.8.7", (api) => {
      // We need to run this on page changes as well as initial load
      api.onPageChange((url, title) => {
        // Only run this logic on the specific category page
        // The URL path for the category is `/c/gemenskaper/5`
        if (url.startsWith("/c/gemenskaper/5")) {
          // A small delay to ensure the DOM is ready
          setTimeout(() => this.setupCategoryFilters(url), 50);
        }
      });
    });
  },

  setupCategoryFilters(currentUrl) {
    const filterButtons = document.querySelectorAll(".category-filters button");
    if (!filterButtons.length) return; // No buttons found, exit

    const router = getOwner(this).lookup("service:router");

    // Helper to update active state
    const updateActiveButton = () => {
        const currentPath = window.location.pathname;
        let activeTag = "all";

        if (currentPath.includes("/tags/")) {
            const pathParts = currentPath.split('/');
            activeTag = pathParts[pathParts.length - 1];
        }

        filterButtons.forEach(btn => {
            btn.classList.remove("active");
            if (btn.dataset.tag === activeTag) {
                btn.classList.add("active");
            }
        });
    };

    filterButtons.forEach((button) => {
      button.addEventListener("click", (event) => {
        event.preventDefault();
        const tag = event.target.dataset.tag;
        const categoryUrl = "/c/gemenskaper/5";

        if (tag === "all") {
          router.transitionTo(categoryUrl);
        } else {
          router.transitionTo(`${categoryUrl}/l/latest/tags/${tag}`);
        }
      });
    });

    // Set initial active state
    updateActiveButton();
  },
};