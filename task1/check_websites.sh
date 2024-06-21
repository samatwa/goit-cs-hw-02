#!/bin/bash

# Визначення масиву з URL вебсайтів
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу логів
log_file="website_status.log"

# Очищення файлу логів перед записом нових результатів
> $log_file 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Failed to clear log file: $log_file"
    exit 1
fi

# Обхід всіх сайтів у списку
for site in "${websites[@]}"; do
  # Отримання HTTP статус-коду за допомогою curl
  status_code=$(curl -o /dev/null -s -w "%{http_code}\n" -L "$site")
  if [ $? -ne 0 ]; then
    echo "Failed to retrieve status code for $site"
    echo "<$site> is DOWN" | tee -a $log_file
    continue
fi

  # Перевірка статус-коду
  if [[ $status_code -eq 200 ]]; then
    echo "<$site> is UP" | tee -a $log_file
  else
    echo "<$site> is DOWN" | tee -a $log_file
  fi
done

# Виведення повідомлення про завершення запису у файл логів
echo "Log file generated: $log_file"