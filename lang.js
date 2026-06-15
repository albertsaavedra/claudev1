function setLang(lang) {
  document.querySelectorAll('[data-en]').forEach(el => {
    el.textContent = el.dataset[lang];
  });
  document.querySelectorAll('.lang-btn').forEach(btn => {
    btn.classList.toggle('active', btn.textContent === lang.toUpperCase());
  });
  document.documentElement.lang = lang;
}
