// Javascript interface controls for Flask Tableau Dashboard

document.addEventListener('DOMContentLoaded', () => {
    // 1. Theme Management
    const themeToggleButton = document.querySelector('.btn-toggle-theme');
    const rootElement = document.documentElement;
    const themeIcon = themeToggleButton ? themeToggleButton.querySelector('i') : null;

    // Load initial theme state
    const savedTheme = localStorage.getItem('app-theme') || 'dark';
    rootElement.setAttribute('data-theme', savedTheme);
    updateThemeIcon(savedTheme);

    if (themeToggleButton) {
        themeToggleButton.addEventListener('click', () => {
            const currentTheme = rootElement.getAttribute('data-theme');
            const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
            rootElement.setAttribute('data-theme', newTheme);
            localStorage.setItem('app-theme', newTheme);
            updateThemeIcon(newTheme);
        });
    }

    function updateThemeIcon(theme) {
        if (!themeIcon) return;
        if (theme === 'dark') {
            themeIcon.className = 'fas fa-sun';
            themeToggleButton.title = 'Switch to Light Theme';
        } else {
            themeIcon.className = 'fas fa-moon';
            themeToggleButton.title = 'Switch to Dark Theme';
        }
    }

    // 2. Fullscreen Toggle
    const fullscreenButton = document.getElementById('btn-fullscreen');
    const vizContainer = document.querySelector('.viz-mockup-window');

    if (fullscreenButton && vizContainer) {
        fullscreenButton.addEventListener('click', () => {
            vizContainer.classList.toggle('fullscreen-mode');
            const isFullscreen = vizContainer.classList.contains('fullscreen-mode');
            const icon = fullscreenButton.querySelector('i');
            
            if (isFullscreen) {
                icon.className = 'fas fa-compress';
                fullscreenButton.title = 'Exit Fullscreen';
                document.body.style.overflow = 'hidden'; // Disable page scrolling
            } else {
                icon.className = 'fas fa-expand';
                fullscreenButton.title = 'Enter Fullscreen';
                document.body.style.overflow = '';
            }
            
            // Force redraw/recalculation of Tableau frame size
            adjustTableauSize();
        });
    }

    // 3. Reload Visualization
    const reloadButton = document.getElementById('btn-reload');
    if (reloadButton) {
        reloadButton.addEventListener('click', () => {
            const loadingOverlay = document.querySelector('.viz-loading-overlay');
            if (loadingOverlay) {
                loadingOverlay.classList.remove('hidden');
            }
            
            // Find Tableau iframe and reload its src
            const iframe = document.querySelector('.tableauViz iframe, .tableauPlaceholder iframe');
            if (iframe) {
                const currentSrc = iframe.src;
                iframe.src = 'about:blank';
                setTimeout(() => {
                    iframe.src = currentSrc;
                }, 100);
            } else {
                // Fallback: reload entire page if element doesn't exist yet
                window.location.reload();
            }
        });
    }

    // 4. Monitoring Tableau Load State
    const placeholder = document.querySelector('.tableauPlaceholder');
    const loadingOverlay = document.querySelector('.viz-loading-overlay');

    if (placeholder && loadingOverlay) {
        // Monitor injection of iframe by the Tableau JS script
        let checkCount = 0;
        const checkInterval = setInterval(() => {
            const iframe = placeholder.querySelector('iframe');
            checkCount++;

            if (iframe) {
                clearInterval(checkInterval);
                
                // Bind to the iframe's load event
                iframe.addEventListener('load', () => {
                    hideLoadingOverlay();
                });
                
                // Fallback: hide overlay after 6 seconds in case load event is missed
                setTimeout(hideLoadingOverlay, 6000);
            }

            // Stop checking after 30 seconds
            if (checkCount > 60) {
                clearInterval(checkInterval);
                hideLoadingOverlay();
            }
        }, 500);
    }

    function hideLoadingOverlay() {
        if (loadingOverlay) {
            loadingOverlay.classList.add('hidden');
        }
    }

    // 5. Responsive Tableau Size Recalculator
    window.addEventListener('resize', () => {
        adjustTableauSize();
    });

    function adjustTableauSize() {
        const divElement = document.querySelector('.tableauPlaceholder');
        if (!divElement) return;
        
        const vizElement = divElement.querySelector('object, iframe');
        if (!vizElement) return;

        // Custom aspect ratio management
        if (vizContainer && vizContainer.classList.contains('fullscreen-mode')) {
            vizElement.style.width = '100%';
            vizElement.style.height = '100%';
        } else {
            vizElement.style.width = '100%';
            // Scale dynamically according to Tableau story native aspect ratio (1016x991)
            const calculatedHeight = divElement.offsetWidth < 1016 
                ? Math.max(650, Math.round(divElement.offsetWidth * (991 / 1016)))
                : 991;
            vizElement.style.height = calculatedHeight + 'px';
        }
    }

    // Initial size calculation
    setTimeout(adjustTableauSize, 1000);
});
