import { LightningElement } from 'lwc';
import { loadScript } from 'lightning/platformResourceLoader';
import CHART_JS from '@salesforce/resourceUrl/minijs';
export default class Chartjstest extends LightningElement {


chart;
    chartJsInitialized = false;

    renderedCallback() {
        if (this.chartJsInitialized) {
            return;
        }
        this.chartJsInitialized = true;

        loadScript(this, CHART_JS)
            .then(() => {
                this.initializeChart();
            })
            .catch(error => {
                console.error('Error loading ChartJS', error);
            });
    }

    initializeChart() {
        const canvas = this.template.querySelector('canvas.doughnutChart');
        const ctx = canvas.getContext('2d');

        this.chart = new window.Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: ['Red', 'Blue', 'Yellow'],
                datasets: [{
                    label: 'My Dataset',
                    data: [300, 50, 100],
                    backgroundColor: [
                        'rgb(255, 99, 132)',
                        'rgb(54, 162, 235)',
                        'rgb(255, 205, 86)'
                    ],
                    hoverOffset: 4
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });
    }
}