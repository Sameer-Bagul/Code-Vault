document.addEventListener('DOMContentLoaded', function () {
  const topics = document.querySelectorAll('.topic');

  topics.forEach(function (topic) {
      topic.addEventListener('click', function () {
          const details = this.nextElementSibling;
          details.classList.toggle('show');
      });
  });
});
