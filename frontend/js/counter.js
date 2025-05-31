window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
});

const apiGateway = 'https://cmdevgetresumecount.azurewebsites.net/api/GetResumeCount?code=tyh9eq-6GCoC3BMWr9lElSD-cvMR8mVsY45W2y8zjhZ8AzFuT8M0OQ==';
const localFunctionApi = 'http://localhost:7071/api/GetResumeCount';

const getVisitCount = () => {
    fetch(apiGateway, {
        mode: 'cors',  
    })
    .then(response => response.json())
    .then(res => {
        document.getElementById('counter').innerText = res.count;
    })
    .catch(error => {
        console.error('Error fetching visit count:', error);
        document.getElementById('counter').innerText = 'N/A';
    });
}
