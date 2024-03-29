document.addEventListener('turbolinks:load', function () {
  var controls = document.querySelectorAll('.form-inline-link')

  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInLineLinkHandler)
    }
  }

  var errors = document.querySelector('.resource-errors')

  if (errors) {
    var resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }

})

function formInLineLinkHandler(event) {
  event.preventDefault();

  var testId = this.dataset.testId;
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
  var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  var formInLine = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

  if (!formInLine) { return }

  if (formInLine.classList.contains('hide')) {
    testTitle.classList.add('hide')
    formInLine.classList.remove('hide')
    link.textContent = 'Отмена'
  } else {
    testTitle.classList.remove('hide')
    formInLine.classList.add('hide')
    link.textContent = 'Редактировать'
  }
}
