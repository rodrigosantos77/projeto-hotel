import "@hotwired/turbo-rails";
import Rails from "@rails/ujs";

Rails.start();  // ✅ Inicia o Rails UJS, necessário para interceptar `data-method="delete"`

import jquery from "jquery";
// Deixa o jQuery acessível globalmente (opcional, só se ainda quiser usar em outras coisas)
window.$ = window.jQuery = jquery;

console.log("jQuery carregado?", typeof jQuery);  // só para conferência
console.log("Rails UJS iniciado?", typeof Rails);  // deve mostrar "object"

document.addEventListener("turbo:load", () => {
  console.log("turbo:load ativado");
  
  // Exemplo de uso do jQuery, só se quiser manter:
  $("body").css("background-color", "#f0f8ff");
});
