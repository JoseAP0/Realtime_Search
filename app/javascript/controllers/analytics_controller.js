import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["input", "suggestions", "form"]

    connect() {
        console.log("Analytics controller connected")
    }

    suggest() {
        const query = this.inputTarget.value
        const url = this.element.dataset.targetUrl

        clearTimeout(this.timeout)
        this.timeout = setTimeout(() => {
            if (query.length > 2) {
                this.requestSearch(query, url)
            }
        }, 1000)
    }

    requestSearch (query, url) {
        if (query.length === 0) {
            this.hideSuggestions()
            return
        }

        this.showSuggestions()

        fetch(url, {
            method: 'POST',
            headers: {
                'content-type': 'application/json',
                'X-CSRF-token': document.querySelector("meta[name='csrf-token']").content},
            body: JSON.stringify({query: query})
        }).then((response) => {
            response.text().then((html) => {
                document.body.insertAdjacentHTML("beforeend", html)
            });
        })
    }


    showSuggestions() {
        this.suggestionsTarget.classList.remove("hidden")
    }

    hideSuggestions() {
        this.suggestionsTarget.classList.add("hidden")
    }

    search_suggestion(event) {
        const text = event.target.textContent.trim()

        this.inputTarget.value = text
        const form = event.currentTarget.closest('form')

        form.requestSubmit()
    }
}