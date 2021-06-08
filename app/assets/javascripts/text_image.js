document.addEventListener('turbolinks:load', () => {
  document.querySelectorAll('.text-image-copy').forEach((element) => {
    const copyBody = element.querySelector('.copy-body')
    const copyButton = element.querySelector('.copy-button')
    copyButton.addEventListener('click', () => {
      copyBody.select();
      document.execCommand('Copy');
      alert('コピーしました!');
    })
  })
})