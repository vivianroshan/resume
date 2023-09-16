
const { chromium } = require('playwright');
const args = process.argv;

(async () => {
    const browser = await chromium.launch({headless: true});
    const page = await browser.newPage();
    try {
        const url = args[2];
		await page.goto(url, {waitUntil: 'domcontentloaded'});
        const pdfOptions = {
            path: args[3],
            format: 'Letter', // or 'A4', 'Letter', 'Legal', 'Tabloid', etc.
            printBackground: true,
            margin: {
                top: '20px',
                right: '20px',
                bottom: '20px',
                left: '20px',
            },
        };
        await page.pdf(pdfOptions);
        console.log(args[3]);
    } catch (error) {
        console.error('Error saving the ' + args[2] + ' as PDF:', error);
    } finally {
        await browser.close();
    }
})();

