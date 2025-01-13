chrome.action.onClicked.addListener(tab => {
	chrome.scripting.executeScript({
		target: {tabId: tab.id},
		func: toggleTextDirection,
	});
});

function toggleTextDirection() {
	const descriptionField = document.querySelector('textarea#description, div[contenteditable="true"]');
	if (descriptionField) {
		const currentDirection = descriptionField.style.direction;
		descriptionField.style.direction = currentDirection === 'rtl' ? 'ltr' : 'rtl';
	} else {
		alert('Jira description field not found on this page.');
	}
}
