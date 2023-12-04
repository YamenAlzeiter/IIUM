document.getElementById('toggle-filters-btn').addEventListener('click', function() {
    var filtersSection = document.getElementById('filters-section');
    filtersSection.style.display = (filtersSection.style.display === 'none' || filtersSection.style.display === '') ? 'block' : 'none';
});