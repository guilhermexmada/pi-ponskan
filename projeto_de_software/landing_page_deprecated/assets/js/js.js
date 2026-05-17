const images = document.querySelectorAll('#carousellogo img');
let current = 1;


setInterval(()=>{
  mover();
}, 1000)


function mover() {
  if(current == 4){
    current = 1;
  }
  const mockup = document.querySelector(`#mockup-0${current}`);
  const last_mockup = document.querySelector(`#mockup-0${current == 1 ? 3 : current - 1}`);
  const next_mockup = document.querySelector(`#mockup-0${current == 3 ? 1 : current + 1}`);
  last_mockup.style.display = 'none';
  next_mockup.style.display = 'none';
  mockup.style.display = 'flex';
  current++;
}



setInterval(() => {
  moveCarousel(1);
}, 5000)

const track = document.getElementById("carousel-track");
let index = 0;

function moveCarousel(direction) {
  const slides = document.querySelectorAll(".carousel-slide");
  index += direction;

  if (index < 0) index = slides.length - 1;
  if (index >= slides.length) index = 0;

  track.style.transform = `translateX(-${index * 100}%)`;
}

function mostrarFoto(nomeArquivo) {
  const nomes = {
    'assets/img/arthur.jpeg': 'Arthur Parra',
    'assets/img/guilherme.jpg': 'Guilherme Shimada',
    'assets/img/guilherme-02.jpg': 'Guilherme Shimada',
    'assets/img/gustavo.jpg': 'Gustavo Kletelinger',
    'assets/img/joao.jpeg': 'João Vitor',
    'assets/img/dani.jpg': 'Danieli Fiel',
    'assets/img/matheus.jpg': 'Matheus Bertoldo',
    'assets/img/matheus-02.jpg': 'Matheus Bertoldo',
  };

  const descricoes = {
    'assets/img/arthur.jpeg': 'Analista de Dados e Arquiteto de Nuvem',
    'assets/img/guilherme.jpg': 'Desenvolvedor Back-end e DevOps',
    'assets/img/guilherme-02.jpg': 'Desenvolvedor Back-end e DevOps',
    'assets/img/gustavo.jpg': 'Analista de Rede e Segurança',
    'assets/img/joao.jpeg': 'Desenvolvedor Fullstack Web',
    'assets/img/dani.jpg': 'Engenheira de software e Engenheira de IA',
    'assets/img/matheus.jpg': 'Desenvolvedor Web Front-end e Designer',
    'assets/img/matheus-02.jpg': 'Desenvolvedor Web Front-end e Designer',
  };

  const nome = nomes[nomeArquivo] || 'Nome não encontrado';
  const descricao = descricoes[nomeArquivo] || 'Descrição não disponível';

  const nomeEl = document.getElementById('nome-membro');
  const descricaoEl = document.getElementById('descricao-membro');
  const fotoEl = document.getElementById('foto-membro');

  // Transição suave
  fotoEl.style.opacity = 0;

  setTimeout(() => {
    nomeEl.textContent = nome;
    descricaoEl.textContent = descricao;
    fotoEl.src = nomeArquivo;
    fotoEl.style.opacity = 1;
  }, 200);
}


function trocarAba(index) {
  const tabs = document.querySelectorAll('.tab');
  const slides = document.querySelectorAll('.slide');

  tabs.forEach(tab => tab.classList.remove('active'));
  slides.forEach(slide => {
    slide.classList.remove('active');
  });

  tabs[index].classList.add('active');
  slides[index].classList.add('active');
}

// ELEMENTOS
const timelinePoints = document.querySelectorAll('.timeline-point')
const timelineTitle = document.getElementById('timeline-title')
const timelineText = document.getElementById('timeline-text')

// EVENTOS
timelinePoints.forEach(point => {

  point.addEventListener('mouseenter', () => {

    // Remove active antigo
    timelinePoints.forEach(p =>
      p.classList.remove('active')
    )

    // Adiciona active atual
    point.classList.add('active')

    // Atualiza conteúdo
    const newTitle = point.dataset.title
    const newText = point.dataset.text

    // Pequena animação
    timelineTitle.style.opacity = 0
    timelineText.style.opacity = 0

    setTimeout(() => {

      timelineTitle.innerText = newTitle
      timelineText.innerText = newText

      timelineTitle.style.opacity = 1
      timelineText.style.opacity = 1

    }, 150)
  })
})