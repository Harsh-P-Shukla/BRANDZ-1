function captureScreenshot(elementId) {
    html2canvas(document.getElementById(elementId)).then(canvas => {
        const link = document.createElement('a');
        link.download = 'screenshot.png';
        link.href = canvas.toDataURL();
        link.click();
    });
}
