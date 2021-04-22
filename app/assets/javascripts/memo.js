document.addEventListener('turbolinks:load', () => {
  const csrfToken = document.querySelector('meta[name="csrf-token"]').content;

  window.previewButton = document.getElementById('memo-preview-btn');
  window.backButton = document.getElementById('memo-back-btn');
  window.memoArea = document.getElementById('memo-area');
  window.memoPreviewArea = document.getElementById('memo-preview-area');
  const memoCount = document.getElementById('memo-count');
  let length = 0;
  const maxLength = 100000;
  let saveStatus = false;

  // メモの保存処理
  const registerMemo = async (e) => {
    e.preventDefault();

    // 文字数がオーバーしている場合は，保存しない
    if (length > maxLength) {
      previewButton.classList.add('disabled');
      alert(`保存に失敗しました。${maxLength.toLocaleString()}文字以内にしてください。`);
      return;
    }

    // 保存中の場合は処理を実行しない
    if (saveStatus) return;

    try {
      previewButton.classList.add('disabled');
      saveStatus = true;
      previewButton.textContent = '保存中……';
      const memoParams = { memo: { content: memoArea.value } };

      response = await fetch(' /memos', {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': csrfToken,
        },
        body: JSON.stringify(memoParams),
      });

      if (!response.ok) {
        throw new Error(`${response.status} (${response.statusText})`);
      }

      previewButton.classList.remove('disabled');
      previewButton.textContent = 'プレビュー';
    } catch (error) {
      previewButton.textContent = '保存に失敗';
      let message;
      if (error.message === 'Failed to fetch') {
        message = '送信に失敗しました。インターネットの接続状況をご確認下さい。';
      } else {
        message = `保存に失敗しました。${error}`;
      }
      alert(message);
    } finally {
      saveStatus = false;
    }
  };

  const backDisplay = () => {
    backButton.classList.add('d-none');
    memoPreviewArea.classList.add('d-none');

    previewButton.classList.remove('d-none');
    memoArea.classList.remove('d-none');
  };

  const countUp = () => {
    length = memoArea.value.length;
    memoCount.textContent = length.toLocaleString();
    memoCount.style.color = length > maxLength ? 'red' : '#495057';
  };

  countUp();
  memoArea.addEventListener('change', registerMemo);
  memoArea.addEventListener('keyup', countUp);
  backButton.addEventListener('click', backDisplay);
});
