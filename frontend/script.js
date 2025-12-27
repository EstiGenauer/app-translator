// אם אנחנו בתוך Docker Compose, נקרא ל-backend בשם השירות; אחרת localhost
const API_URL = window.location.hostname === 'localhost' ? 'http://localhost:3001' : 'http://backend:3001';

const btn = document.getElementById('translateBtn');
const source = document.getElementById('source');
const target = document.getElementById('target');
const result = document.getElementById('result');
const historyList = document.getElementById('history');

btn.addEventListener('click', async () => {
    const text = source.value.trim();
    if (!text) return;

    result.textContent = 'מתרגם...';

    try {
        const res = await fetch(`${API_URL}/translate`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ text, target: target.value })
        });

        const data = await res.json();
        result.textContent = data.translatedText;
        loadHistory();
    } catch (err) {
        result.textContent = 'שגיאה: ' + err.message;
    }
});

async function loadHistory() {
    try {
        const res = await fetch(`${API_URL}/history`);
        const data = await res.json();
        historyList.innerHTML = data
            .map(t => `<li>${t.source_text} → ${t.translated_text}</li>`)
            .join('');
    } catch (err) {
        historyList.innerHTML = '<li>שגיאה בטעינת ההיסטוריה</li>';
    }
}

loadHistory();
