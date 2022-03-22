clc;
clear;
i = 1;  
j = 1;
n = randi([6 10],1)
A = 0 + (.2-0) * rand(n) % Random 0 <= x <= 0.2 x sayısı üreten satır
sutunToplam = zeros(n,1); % 0 vektörü
sum = 0;
       
        %1. KISIM Matris Sütun Toplama

    for i = 1:n
        for j = 1:n
            sum = A(j,i) + sum;
        end
    sutunToplam(i,1) = sum;
    disp(i + ". sutun toplamı = " + sutunToplam(i,1));
    sum = 0;  %tek değişken olduğundan ötürü üstüne toplama yapmaması için
    end
   
    disp("---------------------------------------------------")

            %2. KISIM Fazlalıkları veya Eksik kısmı bulma ve Max - Min Bulma
    fazlalik = 0;
    eksik = 0;
    degisimSayisi1 = 0;
    degisimSayisi2 = 0;
    degisimSayisi3 = 0;
    FazlalikSutunu= zeros(n,1); % Fazlalıkları rahat görmek için
    EksikSutunu = zeros(n,1); % Eksileri rahat görmek için
    for i = 1:n
            if sutunToplam(i,1) > 1
                fazlalik = (sutunToplam(i,1) - 1);
                disp(i + ". sutun fazlaliği = " + fazlalik);
                FazlalikSutunu(i,1)=fazlalik;
                
            elseif sutunToplam(i,1) < 1
                eksik = (1 - sutunToplam(i,1));
                disp(i + ". sutun eksiği = " + eksik);
                EksikSutunu(i,1)=eksik;

            end
    end
   FazlalikSutunu;
   EksikSutunu;
    disp("---------------------------------------------------")
    sortedMaxA = max(A)
    sortedMinA = min(A)

    while any(EksikSutunu)% Minimum için 1'e tamamlama
        for i= 1:n 
            for j= 1:n
                if A(j,i) == sortedMinA(1,i)
                    A(j,i) = (sortedMinA(1,i) + EksikSutunu(i,1));
                    if EksikSutunu(i,1) ~= 0
                        degisimSayisi2 = degisimSayisi2 + 1;
                    end
                    EksikSutunu(i,1) = 0;
                elseif EksikSutunu(i,1) == 0
                    break
                end
            end
        end
    end

while any(FazlalikSutunu) % maksimum için 1'e tamamlama.
    for i = 1:n
        for j = 1:n
            if A(j,i) == sortedMaxA(1,i)
                if FazlalikSutunu(i,1) > sortedMaxA(1,i) 
                    FazlalikSutunu(i,1) = FazlalikSutunu(i,1) - A(j,i); 
                    A(j,i) = 0;
                    degisimSayisi1 = degisimSayisi1 +1;
                    sortedMaxA = max(A);
                elseif FazlalikSutunu(i,1) == 0
                        break
                else
                    A(j,i) = sortedMaxA(1,i) - FazlalikSutunu(i,1);
                    degisimSayisi3 = degisimSayisi3 + 1;
                    FazlalikSutunu(i,1) = 0;
                end 
            end
         end
     end
 end 
            
disp("---------------------------------------------------")
    disp("Düzenlenmiş A matrisi")
    disp(A)
    
       for i = 1:n
            for j = 1:n
                sum = A(j,i) + sum;
            end
        sutunToplam(i,1) = sum;
        disp(i + ". sutun toplamı = " + sutunToplam(i,1));
        sum = 0;
       end

            %3. KISIM DEGİSİM ADIM SAYISI
 
    degisimToplam = degisimSayisi1 + degisimSayisi2 + degisimSayisi3;
    disp("degisim sayisi = " + degisimToplam)