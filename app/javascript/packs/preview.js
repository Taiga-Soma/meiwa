

if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function() {
    const ImageList = document.getElementById('home-box-img');
  
      const createImageHTML = (blob) => {
      const imageElement = document.createElement('div')
      imageElement.setAttribute('class', "image-element")
      let imageElementNum = document.querySelectorAll('.image-element').length
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `home-image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'home[images][]')
      inputHTML.setAttribute('type', 'file')

      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      ImageList.appendChild(imageElement)
      

      inputHTML.addEventListener('change', (e) => {
      file = e.target.files[0];
      blob = window.URL.createObjectURL(file);

      createImageHTML(blob)
      })
    }

    document.getElementById('home-image').addEventListener('change', (e) => {
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);
    
      createImageHTML(blob)
    
    });
  });
}