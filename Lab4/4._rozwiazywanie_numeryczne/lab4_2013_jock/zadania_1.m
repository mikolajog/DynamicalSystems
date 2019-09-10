%%%%%%%%%%%%  Zadanie 1  %%%%%%%%%%%%%%%
sim('zadanie_1');

fig1 = figure;
set(fig1, 'Position', [0 0 800 200])
plot(sim_out1);

fig2 = figure;
set(fig2, 'Position', [0 200 800 200])
plot(sim_out2);

fig3 = figure;
set(fig3, 'Position', [0 400 800 200])
plot(sim_out3);
