import { apiInitializer } from "discourse/lib/api";

// IMPORTANT: Use a relative path to import the component.
// This is more reliable than the 'discourse/theme' path.
import CustomHomepage from "../../common/components/custom-homepage";

export default apiInitializer("0.8", (api) => {
  api.renderInOutlet("custom-homepage", CustomHomepage);
});