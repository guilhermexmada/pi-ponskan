// CARROSSEL
let mockupAtual = 1;
const totalMockups = 6;

setInterval(() => {
  // Esconde o mockup atual e avança para o próximo
  document.getElementById(`mockup-0${mockupAtual}`).style.display = 'none';
  mockupAtual = mockupAtual >= totalMockups ? 1 : mockupAtual + 1;
  document.getElementById(`mockup-0${mockupAtual}`).style.display = 'flex';
}, 1000);


// CARROSSEL DOS PROJETOS
const track = document.getElementById('carousel-track');
let slideAtual = 0;

function moveCarousel(direcao) {
  const slides = document.querySelectorAll('.carousel-slide');
  slideAtual += direcao;
  if (slideAtual < 0) slideAtual = slides.length - 1;
  if (slideAtual >= slides.length) slideAtual = 0;
  track.style.transform = `translateX(-${slideAtual * 100}%)`;
}

setInterval(() => moveCarousel(1), 5000);


// INTEGRANTES DA EQUIPE
const membros = {
  'assets/img/arthur.jpeg': { nome: 'Arthur Parra', cargo: 'Analista de Dados e Arquiteto de Nuvem' },
  'assets/img/guilherme.jpg': { nome: 'Guilherme Shimada', cargo: 'Desenvolvedor Back-end e DevOps' },
  'assets/img/guilherme-02.jpg': { nome: 'Guilherme Shimada', cargo: 'Desenvolvedor Back-end e DevOps' },
  'assets/img/gustavo.jpg': { nome: 'Gustavo Kletelinger', cargo: 'Analista de Rede e Segurança' },
  'assets/img/joao.jpeg': { nome: 'João Vitor', cargo: 'Desenvolvedor Fullstack Web' },
  'assets/img/dani.jpg': { nome: 'Danieli Fiel', cargo: 'Engenheira de Software e Engenheira de IA' },
  'assets/img/matheus.jpg': { nome: 'Matheus Bertoldo', cargo: 'Desenvolvedor Web Front-end e Designer' },
  'assets/img/matheus-02.jpg': { nome: 'Matheus Bertoldo', cargo: 'Desenvolvedor Web Front-end e Designer' },
};

function mostrarFoto(caminho) {
  const membro = membros[caminho] || { nome: 'Nome não encontrado', cargo: 'Descrição não disponível' };
  const fotoEl = document.getElementById('foto-membro');

  fotoEl.style.opacity = 0;
  setTimeout(() => {
    document.getElementById('nome-membro').textContent = membro.nome;
    document.getElementById('descricao-membro').textContent = membro.cargo;
    fotoEl.src = caminho;
    fotoEl.style.opacity = 1;
  }, 200);
}


// CARROSSEL DAS ABAS "O QUE É?"
function trocarAba(indice) {
  document.querySelectorAll('.tab').forEach((tab, i) =>
    tab.classList.toggle('active', i === indice)
  );
  document.querySelectorAll('.slide').forEach((slide, i) =>
    slide.classList.toggle('active', i === indice)
  );
}


// TIMELINE
const timelinePoints = document.querySelectorAll('.timeline-point');
const timelineTitle = document.getElementById('timeline-title');
const timelineText = document.getElementById('timeline-text');

timelinePoints.forEach(point => {
  point.addEventListener('mouseenter', () => {

    timelinePoints.forEach(p => p.classList.remove('active'));
    point.classList.add('active');

    timelineTitle.style.opacity = 0;
    timelineText.style.opacity = 0;

    setTimeout(() => {
      timelineTitle.innerText = point.dataset.title;
      timelineText.innerText = point.dataset.text;
      timelineTitle.style.opacity = 1;
      timelineText.style.opacity = 1;
    }, 150);
  });
});
