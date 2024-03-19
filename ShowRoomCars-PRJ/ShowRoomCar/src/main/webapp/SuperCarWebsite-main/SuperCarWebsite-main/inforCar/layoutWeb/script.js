document.addEventListener("DOMContentLoaded", function () {
    const contactForm = document.getElementById("contact-form");

    contactForm.addEventListener("submit", function (e) {
        e.preventDefault();
        const name = document.getElementById("name").value;
        const email = document.getElementById("email").value;
        const message = document.getElementById("message").value;

        // Giả lập việc gửi thông tin liên hệ
        alert(`Thông tin đã được gửi:\nTên: ${name}\nEmail: ${email}\nTin nhắn: ${message}`);

        // Xóa dữ liệu trong form
        document.getElementById("name").value = "";
        document.getElementById("email").value = "";
        document.getElementById("message").value = "";
    });
});
