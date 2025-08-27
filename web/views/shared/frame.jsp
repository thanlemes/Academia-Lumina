<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Academia Lumina - Educação Transformadora</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            .hero {
                background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://images.unsplash.com/photo-1523050854058-8df90110c9f1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80');
                background-size: cover;
                background-position: center;
                height: 80vh;
            }

            .course-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            }

            .event-card:hover {
                transform: scale(1.03);
            }

            .map-container iframe {
                transition: all 0.3s ease;
            }

            .map-container:hover iframe {
                transform: scale(1.05);
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            }

            @media (max-width: 768px) {
                .hero {
                    height: 60vh;
                }
            }
        </style>
    </head>
    <body class="font-sans bg-gray-50">
        
        <!-- Hero Section -->
        <section class="hero flex items-center justify-center text-center text-white">
            <div class="px-4">
                <h1 class="text-4xl md:text-6xl font-bold mb-6">Educação que Transforma Vidas</h1>
                <p class="text-xl md:text-2xl mb-8 max-w-3xl mx-auto">Na Academia Lumina, cultivamos conhecimento, criatividade e valores para formar os líderes do amanhã.</p>
                <div class="space-x-4">
                    <a href="#cursos" class="bg-indigo-600 hover:bg-indigo-700 text-white px-6 py-3 rounded-full font-medium inline-block transition duration-300">Nossos Cursos</a>
                    <a href="#contato" class="bg-white hover:bg-gray-100 text-indigo-600 px-6 py-3 rounded-full font-medium inline-block transition duration-300">Fale Conosco</a>
                </div>
            </div>
        </section>

        <!-- About Section -->
        <section id="sobre" class="py-16 bg-white">
            <div class="container mx-auto px-4">
                <div class="text-center mb-12">
                    <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-4">Sobre a Academia Lumina</h2>
                    <div class="w-20 h-1 bg-indigo-600 mx-auto"></div>
                </div>

                <div class="flex flex-col md:flex-row items-center">
                    <div class="md:w-1/2 mb-8 md:mb-0 md:pr-8">
                        <img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1471&q=80" alt="Estudantes da Academia Lumina" class="rounded-lg shadow-xl w-full">
                    </div>
                    <div class="md:w-1/2">
                        <h3 class="text-2xl font-semibold text-gray-800 mb-4">Nossa História</h3>
                        <p class="text-gray-600 mb-4">Fundada em 1995, a Academia Lumina surgiu da visão de educadores apaixonados por transformar vidas através do conhecimento. Ao longo de mais de 25 anos, temos formado profissionais competentes e cidadãos conscientes.</p>

                        <h3 class="text-2xl font-semibold text-gray-800 mb-4 mt-6">Missão</h3>
                        <p class="text-gray-600 mb-4">Promover educação de excelência, fomentando o pensamento crítico, a inovação e os valores humanos, preparando nossos alunos para os desafios do século XXI.</p>

                        <h3 class="text-2xl font-semibold text-gray-800 mb-4 mt-6">Valores</h3>
                        <div class="grid grid-cols-2 gap-4">
                            <div class="flex items-start">
                                <i class="fas fa-lightbulb text-indigo-600 mt-1 mr-2"></i>
                                <span class="text-gray-700">Inovação</span>
                            </div>
                            <div class="flex items-start">
                                <i class="fas fa-hand-holding-heart text-indigo-600 mt-1 mr-2"></i>
                                <span class="text-gray-700">Ética</span>
                            </div>
                            <div class="flex items-start">
                                <i class="fas fa-users text-indigo-600 mt-1 mr-2"></i>
                                <span class="text-gray-700">Diversidade</span>
                            </div>
                            <div class="flex items-start">
                                <i class="fas fa-chart-line text-indigo-600 mt-1 mr-2"></i>
                                <span class="text-gray-700">Excelência</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Courses Section -->
        <section id="cursos" class="py-16 bg-gray-50">
            <div class="container mx-auto px-4">
                <div class="text-center mb-12">
                    <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-4">Nossos Cursos</h2>
                    <div class="w-20 h-1 bg-indigo-600 mx-auto"></div>
                    <p class="text-gray-600 max-w-2xl mx-auto mt-4">Programas acadêmicos projetados para impulsionar sua carreira e desenvolvimento pessoal.</p>
                </div>

                <div class="grid md:grid-cols-3 gap-8">
                    <!-- Course 1 -->
                    <div class="course-card bg-white rounded-lg overflow-hidden shadow-md transition duration-300">
                        <img src="https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="Ciência de Dados" class="w-full h-48 object-cover">
                        <div class="p-6">
                            <h3 class="text-xl font-bold text-gray-800 mb-2">Ciência de Dados e Inteligência Artificial</h3>
                            <p class="text-gray-600 mb-4">Domine as técnicas mais avançadas de análise de dados e machine learning para se tornar um especialista neste campo em alta demanda.</p>
                            <div class="flex justify-between items-center">
                                <span class="text-sm font-medium text-indigo-600">Duração: 2 anos</span>
                                <a href="#" class="text-indigo-600 hover:text-indigo-800 font-medium">Saiba mais ?</a>
                            </div>
                        </div>
                    </div>

                    <!-- Course 2 -->
                    <div class="course-card bg-white rounded-lg overflow-hidden shadow-md transition duration-300">
                        <img src="https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1476&q=80" alt="Medicina" class="w-full h-48 object-cover">
                        <div class="p-6">
                            <h3 class="text-xl font-bold text-gray-800 mb-2">Medicina Humanizada</h3>
                            <p class="text-gray-600 mb-4">Formação médica completa com ênfase na relação médico-paciente e nas novas tecnologias da área da saúde.</p>
                            <div class="flex justify-between items-center">
                                <span class="text-sm font-medium text-indigo-600">Duração: 6 anos</span>
                                <a href="#" class="text-indigo-600 hover:text-indigo-800 font-medium">Saiba mais ?</a>
                            </div>
                        </div>
                    </div>

                    <!-- Course 3 -->
                    <div class="course-card bg-white rounded-lg overflow-hidden shadow-md transition duration-300">
                        <img src="https://images.unsplash.com/photo-1552664730-d307ca884978?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" alt="Arquitetura" class="w-full h-48 object-cover">
                        <div class="p-6">
                            <h3 class="text-xl font-bold text-gray-800 mb-2">Arquitetura Sustentável</h3>
                            <p class="text-gray-600 mb-4">Aprenda a projetar espaços que harmonizam estética, funcionalidade e sustentabilidade ambiental.</p>
                            <div class="flex justify-between items-center">
                                <span class="text-sm font-medium text-indigo-600">Duração: 5 anos</span>
                                <a href="#" class="text-indigo-600 hover:text-indigo-800 font-medium">Saiba mais ?</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-12">
                    <a href="#" class="inline-block bg-indigo-600 hover:bg-indigo-700 text-white px-8 py-3 rounded-full font-medium transition duration-300">Ver Todos os Cursos</a>
                </div>
            </div>
        </section>

        <!-- Events Section -->
        <section id="eventos" class="py-16 bg-white">
            <div class="container mx-auto px-4">
                <div class="text-center mb-12">
                    <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-4">Eventos e Atividades</h2>
                    <div class="w-20 h-1 bg-indigo-600 mx-auto"></div>
                    <p class="text-gray-600 max-w-2xl mx-auto mt-4">Participe de nossos eventos acadêmicos, culturais e sociais.</p>
                </div>

                <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <!-- Event 1 -->
                    <div class="event-card bg-gray-50 rounded-lg overflow-hidden shadow-md transition duration-300">
                        <div class="p-6">
                            <div class="flex items-center mb-4">
                                <div class="bg-indigo-100 text-indigo-800 rounded-lg px-4 py-2 mr-4">
                                    <span class="block text-xl font-bold">15</span>
                                    <span class="block text-sm">OUT</span>
                                </div>
                                <div>
                                    <h3 class="text-lg font-bold text-gray-800">Feira de Carreiras 2023</h3>
                                    <p class="text-sm text-gray-500">9:00 - 18:00</p>
                                </div>
                            </div>
                            <p class="text-gray-600 mb-4">Encontro com as principais empresas da região para oportunidades de estágio e emprego para nossos alunos e ex-alunos.</p>
                            <a href="#" class="text-indigo-600 hover:text-indigo-800 font-medium">Mais informações ?</a>
                        </div>
                    </div>

                    <!-- Event 2 -->
                    <div class="event-card bg-gray-50 rounded-lg overflow-hidden shadow-md transition duration-300">
                        <div class="p-6">
                            <div class="flex items-center mb-4">
                                <div class="bg-indigo-100 text-indigo-800 rounded-lg px-4 py-2 mr-4">
                                    <span class="block text-xl font-bold">22</span>
                                    <span class="block text-sm">NOV</span>
                                </div>
                                <div>
                                    <h3 class="text-lg font-bold text-gray-800">Semana da Inovação</h3>
                                    <p class="text-sm text-gray-500">Todo o dia</p>
                                </div>
                            </div>
                            <p class="text-gray-600 mb-4">Palestras, workshops e competições sobre as últimas tendências em tecnologia, negócios e ciência.</p>
                            <a href="#" class="text-indigo-600 hover:text-indigo-800 font-medium">Mais informações ?</a>
                        </div>
                    </div>

                    <!-- Event 3 -->
                    <div class="event-card bg-gray-50 rounded-lg overflow-hidden shadow-md transition duration-300">
                        <div class="p-6">
                            <div class="flex items-center mb-4">
                                <div class="bg-indigo-100 text-indigo-800 rounded-lg px-4 py-2 mr-4">
                                    <span class="block text-xl font-bold">05</span>
                                    <span class="block text-sm">DEZ</span>
                                </div>
                                <div>
                                    <h3 class="text-lg font-bold text-gray-800">Formatura 2023</h3>
                                    <p class="text-sm text-gray-500">19:00 - 23:00</p>
                                </div>
                            </div>
                            <p class="text-gray-600 mb-4">Cerimônia de colação de grau para os formandos deste ano, com presença de autoridades e familiares.</p>
                            <a href="#" class="text-indigo-600 hover:text-indigo-800 font-medium">Mais informações ?</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Map Section -->
        <section class="py-16 bg-gray-50">
            <div class="container mx-auto px-4">
                <div class="text-center mb-12">
                    <h2 class="text-3xl md:text-4xl font-bold text-gray-800 mb-4">Nossa Localização</h2>
                    <div class="w-20 h-1 bg-indigo-600 mx-auto"></div>
                    <p class="text-gray-600 max-w-2xl mx-auto mt-4">Venha nos visitar em nosso campus moderno e arborizado.</p>
                </div>

                <div class="map-container rounded-lg overflow-hidden shadow-lg max-w-4xl mx-auto">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3657.196353585618!2d-46.6568269246876!3d-23.56134727880096!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce59c8da0aa315%3A0xd59f9431f2c9776a!2sAv.%20Paulista%2C%201000%20-%20Bela%20Vista%2C%20S%C3%A3o%20Paulo%20-%20SP%2C%2001310-100!5e0!3m2!1spt-BR!2sbr!4v1688756781233!5m2!1spt-BR!2sbr" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </section>

        <!-- Contact Section -->
        <section id="contato" class="py-16 bg-indigo-700 text-white">
            <div class="container mx-auto px-4">
                <div class="text-center mb-12">
                    <h2 class="text-3xl md:text-4xl font-bold mb-4">Entre em Contato</h2>
                    <div class="w-20 h-1 bg-white mx-auto"></div>
                    <p class="max-w-2xl mx-auto mt-4">Tem dúvidas ou quer saber mais sobre nossos cursos? Nossa equipe está pronta para ajudar.</p>
                </div>

                <div class="max-w-4xl mx-auto grid md:grid-cols-2 gap-8">
                    <div>
                        <h3 class="text-xl font-bold mb-4">Informações de Contato</h3>
                        <div class="space-y-4">
                            <div class="flex items-start">
                                <i class="fas fa-map-marker-alt mt-1 mr-3"></i>
                                <p>Av. Paulista, 1000 - Bela Vista, São Paulo - SP, 01310-100</p>
                            </div>
                            <div class="flex items-start">
                                <i class="fas fa-phone-alt mt-1 mr-3"></i>
                                <p>(11) 1234-5678</p>
                            </div>
                            <div class="flex items-start">
                                <i class="fas fa-envelope mt-1 mr-3"></i>
                                <p>contato@academialumina.edu.br</p>
                            </div>
                            <div class="flex items-start">
                                <i class="fas fa-clock mt-1 mr-3"></i>
                                <p>Segunda a Sexta: 8h às 20h<br>Sábado: 8h às 14h</p>
                            </div>
                        </div>

                        <h3 class="text-xl font-bold mt-8 mb-4">Siga-nos</h3>
                        <div class="flex space-x-4">
                            <a href="#" class="text-white hover:text-indigo-200 text-2xl"><i class="fab fa-facebook"></i></a>
                            <a href="#" class="text-white hover:text-indigo-200 text-2xl"><i class="fab fa-instagram"></i></a>
                            <a href="#" class="text-white hover:text-indigo-200 text-2xl"><i class="fab fa-linkedin"></i></a>
                            <a href="#" class="text-white hover:text-indigo-200 text-2xl"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>

                    <div>
                        <form class="space-y-4">
                            <div>
                                <label for="name" class="block mb-1">Nome Completo</label>
                                <input type="text" id="name" class="w-full px-4 py-2 rounded bg-indigo-600 border border-indigo-500 text-white placeholder-indigo-300 focus:outline-none focus:ring-2 focus:ring-white">
                            </div>
                            <div>
                                <label for="email" class="block mb-1">E-mail</label>
                                <input type="email" id="email" class="w-full px-4 py-2 rounded bg-indigo-600 border border-indigo-500 text-white placeholder-indigo-300 focus:outline-none focus:ring-2 focus:ring-white">
                            </div>
                            <div>
                                <label for="phone" class="block mb-1">Telefone</label>
                                <input type="tel" id="phone" class="w-full px-4 py-2 rounded bg-indigo-600 border border-indigo-500 text-white placeholder-indigo-300 focus:outline-none focus:ring-2 focus:ring-white">
                            </div>
                            <div>
                                <label for="message" class="block mb-1">Mensagem</label>
                                <textarea id="message" rows="4" class="w-full px-4 py-2 rounded bg-indigo-600 border border-indigo-500 text-white placeholder-indigo-300 focus:outline-none focus:ring-2 focus:ring-white"></textarea>
                            </div>
                            <button type="submit" class="bg-white hover:bg-gray-100 text-indigo-700 px-6 py-3 rounded-full font-medium transition duration-300">Enviar Mensagem</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="bg-gray-900 text-white py-8">
            <div class="container mx-auto px-4">
                <div class="flex flex-col md:flex-row justify-between items-center">
                    <div class="mb-4 md:mb-0">
                        <div class="flex items-center">
                            <i class="fas fa-graduation-cap text-2xl text-indigo-400 mr-2"></i>
                            <h2 class="text-xl font-bold">Academia <span class="text-indigo-400">Lumina</span></h2>
                        </div>
                        <p class="text-gray-400 mt-2">Educação de excelência desde 1995</p>
                    </div>

                    <div class="text-gray-400 text-sm text-center md:text-right">
                        <p>&copy; 2023 Academia Lumina. Todos os direitos reservados.</p>
                        <div class="mt-2 space-x-4">
                            <a href="#" class="hover:text-white">Política de Privacidade</a>
                            <a href="#" class="hover:text-white">Termos de Uso</a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Back to Top Button -->
        <button id="backToTop" class="fixed bottom-6 right-6 bg-indigo-600 text-white p-3 rounded-full shadow-lg opacity-0 invisible transition-all duration-300">
            <i class="fas fa-arrow-up"></i>
        </button>

        <script>
            // Back to Top Button
            const backToTopButton = document.getElementById('backToTop');

            window.addEventListener('scroll', () => {
                if (window.pageYOffset > 300) {
                    backToTopButton.classList.remove('opacity-0', 'invisible');
                    backToTopButton.classList.add('opacity-100', 'visible');
                } else {
                    backToTopButton.classList.remove('opacity-100', 'visible');
                    backToTopButton.classList.add('opacity-0', 'invisible');
                }
            });

            backToTopButton.addEventListener('click', () => {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            });

            // Mobile Menu Toggle (placeholder - would need more JS for full functionality)
            document.querySelector('.md\\:hidden').addEventListener('click', function () {
                alert('Menu mobile seria aberto aqui com JavaScript adicional');
            });
        </script>
    </body>
</html>