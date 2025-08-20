import pandoc from "pandoc-filter";
import { codeToHtml } from "shiki";
import { transformerNotationWordHighlight } from "@shikijs/transformers";

/**
 * @param {string} code
 * @param {string} lang
 * @returns {Promise<string>}
 */
function highlightCodeBlock(code, lang) {
  return codeToHtml(code, {
    lang,
    theme: "vitesse-dark",
    transformers: [transformerNotationWordHighlight()],
  });
}

pandoc.stdio(async ({ t: type, c: value }) => {
  if (type === "CodeBlock") {
    const [[_, [lang]], code] = value;
    const highlighted = await highlightCodeBlock(code, lang);

    return pandoc.RawBlock("html", highlighted);
  }
});
