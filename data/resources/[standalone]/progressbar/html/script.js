document.addEventListener("DOMContentLoaded", () => {
    const container = document.querySelector(".progress-container");
    const fillLabel = document.querySelector(".label-fill");

    let animationFrame;

    window.addEventListener("message", (event) => {
        if (event.data.action === "progress") {
            startProgress(event.data.duration);
        } else if (event.data.action === "cancel") {
            cancelProgress();
        }
    });

    function startProgress(duration) {
        container.style.display = "block";
        const start = Date.now();

        function animate() {
            const elapsed = Date.now() - start;
            let progress = elapsed / duration;
            if (progress > 1) progress = 1;

            const percent = Math.floor(progress * 100);
            fillLabel.style.width = percent + "%";

            if (progress < 1) {
                animationFrame = requestAnimationFrame(animate);
            } else {
                completeProgress();
            }
        }

        animate();
    }

    function completeProgress() {
        resetProgress();
        postAction("FinishAction");
    }

    function cancelProgress() {
        cancelAnimationFrame(animationFrame);
        resetProgress();
        postAction("CancelAction");
    }

    function resetProgress() {
        container.style.display = "none";
        fillLabel.style.width = "0%";
    }

    function postAction(action) {
        fetch(`https://progressbar/${action}`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({})
        }).catch(err => console.error("Fetch failed:", err));
    }
});
