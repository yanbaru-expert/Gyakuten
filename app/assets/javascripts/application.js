// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets

document.addEventListener('turbolinks:load', () => {
    // テキスト教材ページ - 検索フォーム内の処理
    const searchText = document.getElementById('search-text')
    if (searchText) {
        const cards = document.querySelectorAll('div.text-card-container')

        const filterCards = (e) => {
            const value = e.target.value.toLowerCase()
            for (const card of cards) {
                const title = card.querySelector('p.text-title')
                const isVisible = title.textContent.toLowerCase().includes(value)
                card.style.display = isVisible ? "" : "none"
            }
        }
        searchText.addEventListener('input', filterCards)
    }

    // 質問ページ - 検索フォーム内の処理
    const genreCheckbox = document.getElementById('genre-checkbox')
    if (genreCheckbox) {
        const inputs = genreCheckbox.querySelectorAll('.custom-control-input')
        const tableRows = document.querySelectorAll('#search-tbody tr')
        let genreList = [...genreCheckbox.querySelectorAll('label')].map(l => l.textContent)
        const filterQuestions = (e) => {
            const genre = e.target.labels[0].textContent
            if (e.target.checked) {
                genreList.push(genre)
            } else {
                const index = genreList.indexOf(genre)
                genreList.splice(index, 1)
            }
            for(const tr of tableRows) {
                const trGenre = tr.querySelector('.question-title').textContent.trim()
                const isVisible = genreList.includes(trGenre)
                tr.style.display = isVisible ? "table-row" : "none"
            }
        }
        for (const input of inputs) {
            input.addEventListener('input', filterQuestions)
        }
    }
})