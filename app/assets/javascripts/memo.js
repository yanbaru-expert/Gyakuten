document.addEventListener('turbolinks:load', () => {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content

    window.previewButton = document.getElementById('memo-preview-btn')
    window.backButton = document.getElementById('memo-back-btn')
    window.memoArea = document.getElementById('memo-area')
    window.memoPreviewArea = document.getElementById('memo-preview-area')

    const registerMemo = (e) => {
        e.preventDefault()
        if (previewButton.classList.contains("disabled")) return

        previewButton.classList.add("disabled")
        previewButton.textContent = "保存中……"
        const memoParams = {memo: {content: memoArea.value}}
        fetch(' /memos', {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': csrfToken
            },
            body: JSON.stringify(memoParams)
        })
            .then(() => {
                previewButton.classList.remove("disabled")
                previewButton.textContent = "プレビュー"
            }).catch(() => {
            previewButton.textContent = "保存に失敗"
            alert('保存に失敗しました。インターネットの接続状況をご確認下さい。')
        })
    }

    const backDisplay = () => {
        backButton.classList.add('d-none')
        memoPreviewArea.classList.add('d-none')

        previewButton.classList.remove("d-none")
        memoArea.classList.remove('d-none')
    }

    memoArea.addEventListener('change', registerMemo)
    backButton.addEventListener('click', backDisplay)
})
