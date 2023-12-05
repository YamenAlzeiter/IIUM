document.addEventListener('DOMContentLoaded', function() {
    var toggleFiltersBtn = document.getElementById('toggle-filters-btn');

    if (toggleFiltersBtn) {
        toggleFiltersBtn.addEventListener('click', function() {
            var filtersSection = document.getElementById('filters-section');
            if (filtersSection) {
                filtersSection.style.display = (filtersSection.style.display === 'none' || filtersSection.style.display === '') ? 'block' : 'none';
            } else {

            }
        });
    } else {

    }
});
