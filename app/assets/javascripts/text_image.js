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

  const imageField = document.querySelector('.image-field')
  const imagePreview = document.querySelector('.image-preview')
  const reader = new FileReader()

  imageField.addEventListener('change', () => {
    const file = imageField.files[0]
    if (!file) {
      imagePreview.classList.add('d-none');
    } else {
      reader.addEventListener('load', () => {
        imagePreview.src = reader.result;
        imagePreview.classList.remove('d-none')
      })
      reader.readAsDataURL(file)
    }
  })
})