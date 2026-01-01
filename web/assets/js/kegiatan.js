/* =====================
   CONFIG
===================== */
const ROWS_PER_PAGE = 5;

/* =====================
   STATE
===================== */
let currentPage = 1;
let allRows = [];
let filteredRows = [];

/* =====================
   INIT
===================== */
document.addEventListener("DOMContentLoaded", () => {
  allRows = Array.from(document.querySelectorAll(".kegiatan-row"));
  filteredRows = [...allRows];

  const searchInput = document.getElementById("searchInput");
  if (searchInput) {
    searchInput.addEventListener("input", handleSearch);
  }

  document.getElementById("prevBtn")?.addEventListener("click", () => {
    currentPage--;
    render();
  });

  document.getElementById("nextBtn")?.addEventListener("click", () => {
    currentPage++;
    render();
  });

  render();
});

/* =====================
   SEARCH (FIXED & STABLE)
===================== */
function handleSearch() {
  const keyword = document
    .getElementById("searchInput")
    .value
    .toLowerCase()
    .trim();

  filteredRows = allRows.filter((row) => {
    const text = row.innerText.toLowerCase();
    return text.includes(keyword);
  });

  currentPage = 1;
  render();
}


/* =====================
   RENDER TABLE + PAGINATION
===================== */
function render() {
  // hide all rows
  allRows.forEach((row) => (row.style.display = "none"));

  const totalRows = filteredRows.length;
  const totalPages = Math.max(1, Math.ceil(totalRows / ROWS_PER_PAGE));

  if (currentPage < 1) currentPage = 1;
  if (currentPage > totalPages) currentPage = totalPages;

  const start = (currentPage - 1) * ROWS_PER_PAGE;
  const end = start + ROWS_PER_PAGE;

  filteredRows.slice(start, end).forEach((row) => {
    row.style.display = "table-row";
  });

  renderPagination(totalPages);
}

/* =====================
   PAGINATION UI
===================== */
function renderPagination(totalPages) {
  const pageInfo = document.getElementById("pageInfo");
  const prevBtn = document.getElementById("prevBtn");
  const nextBtn = document.getElementById("nextBtn");

  if (pageInfo) {
    pageInfo.innerHTML = "";

    for (let i = 1; i <= totalPages; i++) {
      const span = document.createElement("span");
      span.textContent = i;
      span.style.margin = "0 6px";
      span.style.cursor = "pointer";
      span.style.fontWeight = i === currentPage ? "700" : "400";
      span.style.color = i === currentPage ? "#556B2F" : "#2b2b2b";

      span.onclick = () => {
        currentPage = i;
        render();
      };

      pageInfo.appendChild(span);
    }
  }

  // hide/show prev & next
  if (prevBtn) {
    prevBtn.style.display = currentPage === 1 ? "none" : "inline-flex";
  }

  if (nextBtn) {
    nextBtn.style.display =
      currentPage === totalPages ? "none" : "inline-flex";
  }
}

/* =====================
   DETAIL MODAL
===================== */
function openDetail(id) {
  const modal = document.getElementById("detailModal");
  const content = document.getElementById("detailContent");

  modal.style.display = "block";
  content.innerHTML = "Loading...";

  fetch(`${window.contextPath}/program-kegiatan?action=detail&id=${id}`)
    .then((res) => res.text())
    .then((html) => {
      content.innerHTML = html;
    })
    .catch(() => {
      content.innerHTML =
        "<p style='color:red'>Gagal memuat detail kegiatan</p>";
    });
}

function closeDetail() {
  document.getElementById("detailModal").style.display = "none";
}

/* =====================
   DELETE
===================== */
function deleteKegiatan(id) {
  if (!confirm("Yakin ingin menghapus kegiatan ini?")) return false;

  fetch(`${window.contextPath}/program-kegiatan`, {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: `action=delete&id=${id}`
  }).then(() => {
    const row = document
      .querySelector(`a[onclick="openDetail(${id})"]`)
      ?.closest("tr");

    if (row) {
      row.remove();
      allRows = allRows.filter((r) => r !== row);
      handleSearch();
    }
  });

  return false;
}
