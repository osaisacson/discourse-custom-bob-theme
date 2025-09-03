import { apiInitializer } from "discourse/lib/api";
import { hbs } from "ember-cli-htmlbars";

export default apiInitializer("0.8", (api) => {
  // Compile a very simple template directly in this file
  const simpleTemplate = hbs`
    <div style="padding: 40px; text-align: center; background-color: #f0f8ff; border: 2px dashed blue;">
      <h1>Hello from the JavaScript Initializer!</h1>
      <p>If you can see this, it means api.renderInOutlet is working correctly.</p>
    </div>
  `;

  // Render the simple template in the outlet
  api.renderInOutlet("custom-homepage", simpleTemplate);
});