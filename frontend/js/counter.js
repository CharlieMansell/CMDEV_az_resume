window.addEventListener('DOMContentLoaded', (event) => {
    getVisitCount();
});

const apiGateway = 'http://localhost:7071/api/GetResumeCount';

const getVisitCount = () => {
    fetch(apiGateway, {
        mode: 'cors',  // was `node: 'cors'`, which is a typo
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
